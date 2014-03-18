HappySad
========

Simple Sinatra app for tracking sentiment on helpdesk tickets

DB Structure
------------
```
mysql> use happysad;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A


Database changed
mysql> show tables;
+--------------------+
| Tables_in_happysad |
+--------------------+
| responses          |
+--------------------+
1 row in set (0.00 sec)

mysql> describe responses;
+---------------+------------------+------+-----+-------------------+----------------+
| Field         | Type             | Null | Key | Default           | Extra          |
+---------------+------------------+------+-----+-------------------+----------------+
| id            | int(10) unsigned | NO   | PRI | NULL              | auto_increment |
| ticket_number | varchar(16)      | YES  |     | NULL              |                |
| value         | varchar(16)      | YES  |     | NULL              |                |
| dt            | timestamp        | NO   |     | CURRENT_TIMESTAMP |                |
| comment       | text             | YES  |     | NULL              |                |
+---------------+------------------+------+-----+-------------------+----------------+
```

TODO:
* add SQL script for DB creation

