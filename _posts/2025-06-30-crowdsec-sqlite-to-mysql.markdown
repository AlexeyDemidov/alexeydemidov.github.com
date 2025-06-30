---
layout: single
title: "CrowdSec SQLite to MySQL migration"
date: 2025-06-30 12:35:30 +0400
comments: true
categories: Linux
---


How to convert CrowdSec Local API database from SQLite to MySQL or MariaDB.

The official CrowdSec [documentation][4] doesn't provide instructions on data migration from SQLite to MySQL or MariaDB, and expects the user to re-register all machines and bouncers, which is inconvenient.

Let's try a straightforward approach: dump the SQLite database into plain SQL and import it into MariaDB (we are running Ubuntu 24.04 Noble).

We need to create a database for CrowdSec first. We can follow [the instructions][1] from the documentation:

```
mysql> CREATE DATABASE crowdsec;  
mysql> CREATE USER 'crowdsec'@'%' IDENTIFIED BY '<password>';  
mysql> GRANT ALL PRIVILEGES ON crowdsec.* TO 'crowdsec'@'%';  
mysql> FLUSH PRIVILEGES;
```

We will need `mysql` and `sqlite3` on the host where we have CrowdSec installed:

```
sudo apt install mariadb-client sqlite3
```

Check the location of the CrowdSec SQLite database file:

```
cscli config show --key "Config.DbConfig.DbPath"
```

Let's try the dump-pipe-import:

```
# sqlite3 `cscli config show --key "Config.DbConfig.DbPath"` '.dump' |\
    mysql -h mysqlhost -u crowdsec -p crowdsec
Enter password:
--------------
PRAGMA foreign_keys=OFF
--------------

ERROR 1064 (42000) at line 1: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'PRAGMA foreign_keys=OFF' at line 1
```

Unfortunately, SQLite and MySQL/MariaDB have incompatible syntax. 

Let's look for a solution. There is a Python tool, [`sqlite3-to-mysql`][2], which does exactly what we need:  transfer data from SQLite3 to MySQL.
```
apt install python3-venv
python3 -m venv .venv
source .venv/bin/activate
pip install sqlite3-to-mysql
```

Now we can convert the data, but stop the CrowdSec first, so we don't get inconsistent data.

```
systemctl stop crowdsec
```

Now convert the data:
```
sqlite3mysql -f `cscli config show --key "Config.DbConfig.DbPath"` -h mysqlhost -d crowdsec  -u crowdsec -p
```

The data conversion runs without errors, and we get the data into MariaDB.

Now we can update the `/etc/crowdsec/config.yaml` to use MariaDB (See [the documentation][3]):

```
db_config:
  log_level: info
  # type: sqlite
  # db_path: /var/lib/crowdsec/data/crowdsec.db
  type: mysql
  db_name: crowdsec
  user: crowdsec
  password: <password>
  host: mysqlhost
  port: 3306
```

But when we try to start CrowdSec, it fails with a fatal error: 

```
level=fatal msg="unable to create database client: failed creating schema resources: sql/schema: modify \"machines\" table: Error 1833: Cannot
 change column 'id': used in a foreign key constraint 'alerts_FK_0_0' of table 'crowdsec.alerts'"
```

There seems to be a difference in CrowdSec database schemas between `SQLite` and `MySQL/MariaDB`. Let's try to work around that. 

First, recreate the database to clear all the imported data.

```
DROP DATABASE crowdsec;
CREATE DATABASE crowdsec;
```

Start CrowdSec with `systemctl start crowdsec`. It is going to fail, but it will create the correct database schema. (Backup your `local_api_credentials.yaml` - it overwrote it with new credentials, but I can't repeat this in a clean environment.)

Now we can try to convert the data again, but without creating the schema (option `-K`) this time (it also uses a hardcoded path to the SQLite database):
```
sqlite3mysql -K -f /var/lib/crowdsec/data/crowdsec.db -h mysqlhost -d crowdsec  -u crowdsec -p 
```

Now we can start CrowdSec with `systemctl start crowdsec`, and it works without any issues. 


[1]:https://docs.crowdsec.net/docs/next/local_api/database/#mysql-and-mariadb
[2]:https://github.com/techouse/sqlite3-to-mysql/
[3]:https://docs.crowdsec.net/docs/next/configuration/crowdsec_configuration/#db_config
[4]:https://docs.crowdsec.net/docs/next/local_api/database/
