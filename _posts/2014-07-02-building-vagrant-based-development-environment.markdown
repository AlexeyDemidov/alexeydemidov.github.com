---
layout: post
title: "Building Vagrant-based development environment"
date: 2014-07-02 10:32:42 +0400
comments: true
categories: DevOps
keywords: "vagrant, development environment, deployment, test kitchen"
published: true
---

Over the course of the last few months I have built three different custom
[Vagrant](http://www.vagrantup.com) boxes to create local development environment for two different
applications &mdash; one is [WordPress](http://wordpress.org) based and another is Rails one with a few <abbr>PHP</abbr>
parts. 

The problem which Vagrant solved was that both applications are too complex to
setup manually. Even when working with [WordPress](http://wordpress.org)
developers didn't work locally but instead used to edit files directly on live
server and even when we imported all code into `git` they started using
integration server for day-to-day development and their workflow looked
terrible &mdash; change a line, commit, push, wait for deploy script to run,
check integration server for results, repeat. Moreover, as a result of this
workflow `git` history looked ugly &mdash; myriad of one-line commits with no
commit messages, which are painful to merge. For Rails app we needed some
<abbr>CSS</abbr>/<abbr>HTML</abbr> tweaks and there is just no way average
front-end developer can setup Rails development environment on Windows.

At first I thought about distributing binary Vagrant box but I still needed to
distribute application source code as `git` repository and Vagrantfile to
configure sharing and I was too lazy to setup password protected directory on
web server to download binary box and hand out all credentials to individual
developers ([Vagrant Cloud for organizations](http://www.hashicorp.com/blog/vagrant-cloud-end-of-beta.html)
hadn't been available yet). So I decided to make one single `git` repo with
Vagrant configuration and cookbooks and source code repo
included as submodule.

It was a while since I did chef cookbook development so I googled a lot at
first trying to find what is the best current approach and which tools to use.
Cookbook development completely changed over last year or two &mdash; there are now
[test-kitchen](http://kitchen.ci), [berkshelf](http://berkshelf.com),
[serverspec](http://serverspec.org) etc and all these tools are changing very
fast &mdash; almost any tutorial older than a few months is obsolete. 

So far I have found following blog posts as the most current:

- [Getting Started Writing Chef Cookbooks the Berkshelf Way](http://misheska.com/blog/2013/08/06/getting-started-writing-chef-cookbooks-the-berkshelf-way-part3/) (ignore parts 1 and 2)

- [Automating Cookbook Testing with Test-Kitchen, Berkshelf, Vagrant and Guard](https://micgo.net/automating-cookbook-testing-with-test-kitchen-berkshelf-vagrant-and-guard/)

In my setup I have followed the second one and cross-checked with the first
article. I chose to include in my toolbox [test-kitchen](http://kitchen.ci), [berkshelf](http://berkshelf.com), [serverspec](http://serverspec.org),
[chefspec](http://sethvargo.github.io/chefspec/), [foodcritic](http://acrmp.github.io/foodcritic/), 
[rubocop](https://github.com/bbatsov/rubocop) and wrap everything with [guard](http://guardgem.org/) (but later disabled `test-kitchen` run from `guard` as it was failing). In the beginning
I started preparing custom Vagrant base box with [veewee](https://github.com/jedi4ever/veewee) but dropped it as I
didn't really need anything custom and standard `chef/debian` box from
[vagrantcloud.com](http://vagrantcloud.com) worked well.

My main repo has very simple structure &mdash; `Gemfile` with `berkshelf`,
`Berksfile` with all necessary cookbooks, `Vagrantfile` and `INSTALL` file with
step-by-step instructions for developers. In `www` sub-directory I have site source code as
`git` submodule and in `cookbooks` sub-directory all depended cookbooks vendored
using `berks vendor cookbooks`. At first I used to include my own cookbooks as
`git` submodule too into `site-cookbooks` but as `berks vendor` retrieves them
anyway I dropped this. Also I decided not to use
[vagrant-berkshelf](https://github.com/berkshelf/vagrant-berkshelf) plugin to
maintain cookbooks as it is
[deprecated](https://sethvargo.com/the-future-of-vagrant-berkshelf/). 

For each application I created individual cookbook and one cookbook for common
configuration. Each cookbook has own `git` repo and follows standard layout
created by `berks cookbook`. I have also decided to rely on community
cookbooks for all dependencies like MySQL, <abbr>PHP</abbr> etc, even though I didn't do much
customization but this decision caused a bit of pain &mdash; I had to fork cookbooks
for MySQL and `monit` to support Debian squeeze and had to use alternative cookbook
for <abbr>PHP</abbr> as `phpmyadmin` cookbook depends on it. Each cookbook has multiple recipes: for
Vagrant setup, for integration server setup and for live server setup as there
is some differences between them &mdash; <abbr>SSL</abbr> support and while integration server
runs `php-fpm` live server still uses `mod_php`. 

At first I followed quite strict <abbr>TDD</abbr>/<abbr>BDD</abbr> loop &mdash; create `serverspec` tests, then
`chefspec` and then write recipe but after a while dropped `chefspec` tests as I
find writing `expect(chef_run).to include_recipe('apache2')` and then
`include_recipe 'apache2'` a bit boring. Also running `kitchen converge &&
kitchen verify` is quite slow even with a lot of <abbr>RAM</abbr> and on <abbr>SSD</abbr> disk. I
tried to speed up things by switching to <abbr>LXC</abbr> but `kitchen-lxc` seems to be broken
and unsupported and using `vagrant-lxc` with `test-kitchen` isn't documented
very well and requires building <abbr>LXC</abbr> base boxes manually using 
[outdated instructions](http://fabiorehm.com/blog/2013/07/18/crafting-your-own-vagrant-lxc-base-box/)
&mdash; some links to configuration templates are 404 and after you build base boxes
recent Vagrant complains about outdated box format. My attempts to use 
[more up to date scripts](https://github.com/fgrehm/vagrant-lxc-base-boxes) to build
base box failed as these scripts just segfaulted on me and I didn't have time
to fix them as manually built base boxes already working. Another issue
is that my Linux Mint box had `sudo` configuration setting which caused
`vagrant-lxc` to fail when used with `test-kitchen` and a couple weeks passed
before [I found time to find a solution](http://stackoverflow.com/questions/23480155/vagrant-lxc-fails-to-start-when-run-from-test-kitchen)
so all cookbooks were developed slowly using [VirtualBox](https://www.virtualbox.org/). 

But overall development went quite smoothly except for few PHP/WordPress
surprises in the end &mdash; e.g. PHP with `short_open_tag` switched fails with
`syntax error` pointing to the end of huge 5K LOC .php file without any hint of
real error cause or WordPress shows just blank front page without any error
messages in error logs if some plugin fails or missing. But real adventure was
still ahead. When all cookbooks were ready and fully tested locally on Linux
and Mac OS X it was time to deploy to Windows boxes where everything failed
just at the very beginning &mdash; Vagrant was launching VirtualBox VMs but unable to
`ssh` into them. Few days of remote debugging using email and I had found
that even `vagrant init hashicorp/precise` failed to work on Windows so I 
got idea and tried to switch to 32-bit OS image which worked. Later I got RDP
access to Window 8 box and launched VirtualBox directly which
complained that VT-x is disabled (it needs to be enabled in BIOS and this
feature is unavailable on Celeron processors) and it can't launch 64-bit image.
Once I switched images to 32-bit all Windows users were able to use them
without much problems, except occasional cases when developers didn't read
documentation and forgot to use `git clone --recursive` and similar issues. 

Another quite problematic issue with Windows was that it is impossible to
create symbolic links on shared file system with default settings and Rails app
were deployed `capistrano` style and relied on symbolic links heavily. I had to
revamp whole recipe for Rails app and remove all symbolic links to get it
working on Vagrant under Windows. Another Rails specific issue is that `rvm`
cookbooks needs special recipe `rvm::vagrant` to be included before any other
recipe if it is run in Vagrant VM. 

{% comment %}

mysql change
{% endcomment %}
