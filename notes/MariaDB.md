# MariaDB [Wiki](http://en.wikipedia.org/wiki/MariaDB)
After the 5.5 version, MariaDB developers decided to start a branch numbered 10, as an attempt to make it clear that MariaDB 10.0 will not import all features from MySQL 5.6; 

# Install
- [Download](https://downloads.mariadb.org/)
- [Mint Version](https://downloads.mariadb.org/mariadb/repositories/#mirror=jmu&distro=Mint&distro_release=trusty--mint17_qiana&version=10.0)
- Linux x86_64: mariadb-10.0.19-linux-x86_64.tar.gz
==> [Installing MariaDB Binary Tarballs](https://mariadb.com/kb/en/mariadb/installing-mariadb-binary-tarballs/)

Installing MariaDB as not root in any directory:

	lplin@dlm47 ~/apps $ ln -s mariadb-10.0.19-linux-x86_64/ mariadb
	lplin@dlm47 ~/apps $ cd mariadb
	lplin@dlm47 ~/apps/mariadb $ ./scripts/mysql_install_db --defaults-file=~/.my.cnf
	Installing MariaDB/MySQL system tables in '/home/lplin/apps/mariadb-data' ...
	150512 11:11:24 [Note] ./bin/mysqld (mysqld 10.0.19-MariaDB-log) starting as process 9585 ...
	150512 11:11:24 [Warning] An old style --language or -lc-message-dir value with language specific part detected: /home/lplin/apps/mariadb/share/english/
	150512 11:11:24 [Warning] Use --lc-messages-dir without language specific part instead.
	150512 11:11:24 [Note] InnoDB: Using mutexes to ref count buffer pool pages
	150512 11:11:24 [Note] InnoDB: The InnoDB memory heap is disabled
	150512 11:11:24 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
	150512 11:11:24 [Note] InnoDB: Memory barrier is not used
	150512 11:11:24 [Note] InnoDB: Compressed tables use zlib 1.2.3
	150512 11:11:24 [Note] InnoDB: Using Linux native AIO
	150512 11:11:24 [Note] InnoDB: Using CPU crc32 instructions
	150512 11:11:24 [Note] InnoDB: Initializing buffer pool, size = 128.0M
	150512 11:11:24 [Note] InnoDB: Completed initialization of buffer pool
	150512 11:11:24 [Note] InnoDB: Highest supported file format is Barracuda.
	150512 11:11:24 [Note] InnoDB: 128 rollback segment(s) are active.
	150512 11:11:24 [Note] InnoDB: Waiting for purge to start
	150512 11:11:24 [Note] InnoDB:  Percona XtraDB (http://www.percona.com) 5.6.23-72.1 started; log sequence number 1600608
	150512 11:11:25 [Note] InnoDB: FTS optimize thread exiting.
	150512 11:11:25 [Note] InnoDB: Starting shutdown...
	150512 11:11:26 [Note] InnoDB: Shutdown completed; log sequence number 1616708
	OK
	Filling help tables...
	150512 11:11:26 [Note] ./bin/mysqld (mysqld 10.0.19-MariaDB-log) starting as process 9613 ...
	150512 11:11:26 [Warning] An old style --language or -lc-message-dir value with language specific part detected: /home/lplin/apps/mariadb/share/english/
	150512 11:11:26 [Warning] Use --lc-messages-dir without language specific part instead.
	150512 11:11:26 [Note] InnoDB: Using mutexes to ref count buffer pool pages
	150512 11:11:26 [Note] InnoDB: The InnoDB memory heap is disabled
	150512 11:11:26 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
	150512 11:11:26 [Note] InnoDB: Memory barrier is not used
	150512 11:11:26 [Note] InnoDB: Compressed tables use zlib 1.2.3
	150512 11:11:26 [Note] InnoDB: Using Linux native AIO
	150512 11:11:26 [Note] InnoDB: Using CPU crc32 instructions
	150512 11:11:26 [Note] InnoDB: Initializing buffer pool, size = 128.0M
	150512 11:11:26 [Note] InnoDB: Completed initialization of buffer pool
	150512 11:11:26 [Note] InnoDB: Highest supported file format is Barracuda.
	150512 11:11:26 [Note] InnoDB: 128 rollback segment(s) are active.
	150512 11:11:26 [Note] InnoDB: Waiting for purge to start
	150512 11:11:26 [Note] InnoDB:  Percona XtraDB (http://www.percona.com) 5.6.23-72.1 started; log sequence number 1616708
	150512 11:11:27 [Note] InnoDB: FTS optimize thread exiting.
	150512 11:11:27 [Note] InnoDB: Starting shutdown...
	150512 11:11:29 [Note] InnoDB: Shutdown completed; log sequence number 1616718
	OK

	To start mysqld at boot time you have to copy
	support-files/mysql.server to the right place for your system

	PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
	To do so, start the server, then issue the following commands:

	'./bin/mysqladmin' -u root password 'new-password'
	'./bin/mysqladmin' -u root -h dlm47 password 'new-password'

	Alternatively you can run:
	'./bin/mysql_secure_installation'

	which will also give you the option of removing the test
	databases and anonymous user created by default.  This is
	strongly recommended for production servers.

	See the MariaDB Knowledgebase at http://mariadb.com/kb or the
	MySQL manual for more instructions.

	You can start the MariaDB daemon with:
	cd '.' ; ./bin/mysqld_safe --datadir='/home/lplin/apps/mariadb-data'

	You can test the MariaDB daemon with mysql-test-run.pl
	cd './mysql-test' ; perl mysql-test-run.pl

	Please report any problems at http://mariadb.org/jira

	The latest information about MariaDB is available at http://mariadb.org/.
	You can find additional information about the MySQL part at:
	http://dev.mysql.com
	Support MariaDB development by buying support/new features from MariaDB
	Corporation Ab. You can contact us about this at sales@mariadb.com.
	Alternatively consider joining our community based development effort:
	http://mariadb.com/kb/en/contributing-to-the-mariadb-project/

# Config .my.cnf
[Minimal my.cnf file](https://mariadb.com/kb/en/mariadb/mysqld-configuration-files-and-groups/)

	[client-server]
	# Uncomment these if you want to use a nonstandard connection to MariaDB
	socket=/home/lplin/tmp/mariadb.sock
	port=13306

	# This will be passed to all MariaDB clients
	[client]
	#password=my_password

	# The MariaDB server
	[mysqld]
	# Directory where you want to put your data
	data=/home/lplin/apps/mariadb-data
	# Directory for the errmsg.sys file in the language you want to use
	language=/home/lplin/apps/mariadb/share/english
	# Create a file where the InnoDB/XtraDB engine stores it's data
	loose-innodb_data_file_path = ibdata1:1000M
	loose-innodb_file_per_table

	# This is the prefix name to be used for all log, error and replication files
	log-basename=mariadb

	# Enable logging by default to help find problems
	general-log
	# log-slow-queries # [ERROR] ./bin/mysqld: unknown option '--log-slow-queries'

# start the server
	./bin/mysqld_safe --datadir='/home/lplin/apps/mariadb-data' --defaults-file=~/.my.cnf & --pid-file=file_name

# Installing MariaDB Alongside MySQL [...](https://mariadb.com/kb/en/mariadb/installing-mariadb-alongside-mysql/)
Also need to set in /etc/init.d/mariadb:

	mysqld_pid_file_path=/opt/mariadb-data/mariadb.pid

Setting password:

	mariadb@hp110nr ~ $ ./bin/mysqladmin -u root -h hp110nr --port=3307 password 'rdc-123'

More detailed wiki: [MariaDB alongside MySQL](http://wiki.contribs.org/MariaDB_alongside_MySQL)

	'cp' -f /opt/mariadb/support-files/my-medium.cnf /opt/mariadb-data/my.cnf
	sed -i -e '/^port.*3306$/ s/= 3306/= 3307/' /opt/mariadb-data/my.cnf
	sed -i -e '/^socket.*= \/tmp\/mysql.sock/ s~= /tmp/mysql.sock~= /opt/mariadb-data/mariadb.sock~' /opt/mariadb-data/my.cnf
	#
	BASEDIR='basedir\t\t= /opt/mariadb'
	DATADIR='datadir\t\t= /opt/mariadb-data'
	USER='user\t\t= mariadb'
	PIDFILE='pid-file\t= /var/run/mariadb/mariadb.pid'
	sed -i -e "/^\[mysqld\]$/ s~\[mysqld\]~\[mysqld\]\n$DATADIR\n$BASEDIR\n$USER\n$PIDFILE~" /opt/mariadb-data/my.cnf

Set password:

	CONNECT=--socket=/opt/mariadb-data/mariadb.sock
	mariadb@dlm47 ~ $ ./bin/mysqladmin $CONNECT -u root password 'rdc-123'
	./bin/mysqladmin: unknown variable 'secure-auth=OFF'
	mariadb@dlm47 ~ $ ./bin/mysql -u root
	ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
	mariadb@dlm47 ~ $ ./bin/mysql -u root --password="rdc-123"
	Welcome to the MariaDB monitor.  Commands end with ; or \g.

# rdcapp User
	CREATE USER 'rdcapp'@'localhost' IDENTIFIED BY '321-rdc';
	GRANT ALL PRIVILEGES ON *.* TO 'rdcapp'@'localhost' WITH GRANT OPTION;


# Shutdown [...](https://mariadb.com/kb/en/mariadb/iniciando-e-parando-mariadb-automaticamente/)
	mariadb@dlm47 ~ $ /etc/init.d/mariadb stop
	Shutting down MySQL
	.. * 

# Client
	mariadb@dlm47 ~ $ export MYSQL_HOME=/opt/mariadb-data
	mariadb@dlm47 ~ $ mysql
	Welcome to the MySQL monitor.  Commands end with ; or \g.

	lplin@dlm47 ~/bin $ mysql
	ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
	lplin@dlm47 ~/bin $ export MYSQL_HOME=/opt/mariadb-data
	lplin@dlm47 ~/bin $ mysql
	Welcome to the MySQL monitor.  Commands end with ; or \g.

	lplin@dlm47 ~/bin $ mysql -urdcapp -p321-rdc
	Warning: Using a password on the command line interface can be insecure.
	Welcome to the MySQL monitor.  Commands end with ; or \g.

Or just:

	mysql --port=3307 -h dlm47

# Cannot see case_framemf schema

	select * from mysql.user;
	GRANT ALL PRIVILEGES ON *.* TO 'rdcapp'@'%' WITH GRANT OPTION;
	SELECT * FROM information_schema.USER_PRIVILEGES;

# Cannot login from another host
	lplin@dlm47 ~ $ mysql --port=3307 -h dlm47 -urdcapp -p321-rdc
	Warning: Using a password on the command line interface can be insecure.
	ERROR 1045 (28000): Access denied for user 'rdcapp'@'dlm47' (using password: YES)
 
|Host |User|Password|Select_priv|Insert_priv|Update_priv|Delete_priv|Create_priv|Drop_priv|Reload_priv|Shutdown_priv|Process_priv|File_priv|Grant_priv|References_priv|Index_priv|Alter_priv|Show_db_priv|Super_priv|Create_tmp_table_priv|Lock_tables_priv|Execute_priv|Repl_slave_priv|Repl_client_priv|Create_view_priv|Show_view_priv|Create_routine_priv|Alter_routine_priv|Create_user_priv|Event_priv|Trigger_priv|Create_tablespace_priv|ssl_type|ssl_cipher|x509_issuer|x509_subject|max_questions|max_updates|max_connections|max_user_connections|plugin|authentication_string|password_expired|is_role|
|-----|----|--------|-----------|-----------|-----------|-----------|-----------|---------|-----------|-------------|------------|---------|----------|---------------|----------|----------|------------|----------|---------------------|----------------|------------|---------------|----------------|----------------|--------------|-------------------|------------------|----------------|----------|------------|----------------------|--------|----------|-----------|------------|-------------|-----------|---------------|--------------------|------|---------------------|----------------|-------|
|dlm47|    |        |N          |N          |N          |N          |N          |N        |N          |N            |N           |N        |N         |N              |N         |N         |N           |N         |N                    |N               |N           |N              |N               |N               |N             |N                  |N                 |N               |N         |N           |N                     |        |...       |...        |...         |0            |0          |0              |0                   |      |                     |N               |N      |

	select * from mysql.user WHERE host='dlm47' AND user='';
	DELETE from mysql.user WHERE host='dlm47' AND user='';
==> No use; root is OK

	lplin@dlm47 ~ $ mysql --port=3307 -h dlm47 -uroot
	Welcome to the MySQL monitor.  Commands end with ; or \g.
	Your MySQL connection id is 39
	Server version: 5.5.5-10.0.19-MariaDB-log MariaDB Server

==> grant also fail (https://rtcamp.com/tutorials/mysql/remote-access/)

	GRANT ALL PRIVILEGES ON *.* TO 'rdcapp'@'dlm47' WITH GRANT OPTION;

==> Work: [You can disable all security by editing /etc/my.cnf](http://stackoverflow.com/questions/10236000/allow-all-remote-connections-mysql)

	[mysqld]
	skip-grant-tables

==> Java doesn't work
	Caused by: java.sql.SQLException: Access denied for user 'rdcapp'@'dlm47' (using password: YES)

==> Turned out auth doesn't work.

	lplin@dlm47 ~ $ mysql --port=3307 --host=dlm47 -urdcapp
	Welcome to the MySQL monitor.  Commands end with ; or \g.

==> Turned out password not set in mysql.user

	lplin@dlm47 ~ $ mysql --port=3307 --host=localhost -urdcapp
	ERROR 1045 (28000): Access denied for user 'rdcapp'@'localhost' (using password: NO)
	lplin@dlm47 ~ $ mysql --port=3307 --host=localhost -urdcapp -p321-rdc
	Warning: Using a password on the command line interface can be insecure.
	Welcome to the MySQL monitor.  Commands end with ; or \g.


#  Cannot login from localhost
	lplin@dlm47 ~ $ mysql --port=3307 --host=localhost -urdcapp 
	ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

	lplin@dlm47 ~ $ sudo /etc/init.d/mysql start
	[sudo] password for lplin: 
	......
	 * MySQL Community Server 5.6.21 is started
==>

	lplin@dlm47 ~ $ mysql --port=3307 --host=localhost -urdcapp -p321-rdc
	Warning: Using a password on the command line interface can be insecure.
	Welcome to the MySQL monitor.  Commands end with ; or \g.

# Drop user
	DROP USER 'rdcapp'@'dlm47'
  
# Set password [...](https://mariadb.com/blog/how-reset-root-password-mariadb-linux)
	$ mysqladmin -u root -p 'old-password' password 'new-password'

	mariadb@dlm47 ~ $ bin/mysqladmin -u root password '321-rdc'
	bin/mysqladmin: unknown variable 'secure-auth=OFF'
	==> Bug? https://bugs.mysql.com/bug.php?id=69886, http://bugs.mysql.com/bug.php?id=69051

	[MARIADB: CHANGE A USER PASSWORD](http://www.techonthenet.com/mariadb/change_password.php)
	SET PASSWORD FOR 'rdcapp'@'%' = PASSWORD('321-rdc');
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('321-rdc');
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
	SET PASSWORD FOR 'root'@'%' = PASSWORD('321-rdc');
	DROP USER 'root'@'dlm47';
	SELECT * from mysql.user;

# secure-auth variable, or secure_auth?
SHOW VARIABLES LIKE 'skip_networking'; -- OFF
SHOW VARIABLES LIKE 'secure-auth'; -- Empty

SHOW VARIABLES LIKE 'secure_auth'; -- OFF

# UTF8, OK

	SHOW VARIABLES LIKE 'secure_auth'; -- OFF
	SELECT * FROM case_framemf.user; -- admin100091

	CREATE DATABASE c6
	  DEFAULT CHARACTER SET utf8
	  DEFAULT COLLATE utf8_unicode_ci;

	CREATE TABLE person (
		BusinessID VARCHAR(255) NOT NULL,
		NAID VARCHAR(255) NOT NULL,
		Forename VARCHAR(255) NULL,
		Middlename VARCHAR(255) NULL,
		Surname VARCHAR(255) NULL,
		DoB VARCHAR(255) NULL,
		AddressLine1 VARCHAR(255) NULL,
		AddressLine2 VARCHAR(255) NULL,
		AddressLine3 VARCHAR(255) NULL,
		AddressLine4 VARCHAR(255) NULL,
		AddressLine5 VARCHAR(255) NULL,
		AddressLine6 VARCHAR(255) NULL,
		PostCode VARCHAR(255) NULL,
		Country VARCHAR(255) NULL,
		SequenceNumber VARCHAR(255) NULL,
		ParentSequenceNumber VARCHAR(255) NULL
	 )
	 ;
     
	LOAD DATA INFILE '/tmp/PersonsFinal.txt'
	INTO TABLE person
	CHARACTER SET UTF8
	FIELDS TERMINATED BY '\t'
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
	-- 	IGNORE 1 ROWS;
     
	SELECT * FROM person;
	TRUNCATE TABLE person;

	SELECT * FROM person WHERE -- 2550
		(NOT HEX(Forename) REGEXP '^([0-7][0-9A-F])*$') OR 
		  (NOT HEX(Middlename) REGEXP '^([0-7][0-9A-F])*$') OR
		(NOT HEX(Surname) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(DoB) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(AddressLine1) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(AddressLine2) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(AddressLine3) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(AddressLine4) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(AddressLine5) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(AddressLine6) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(Country) REGEXP '^([0-7][0-9A-F])*$') OR 
		(NOT HEX(PostCode) REGEXP '^([0-7][0-9A-F])*$')
	;
    
	SELECT COUNT(*) FROM person; -- 49676

# Dump

mysqldump -u [username] -p [database_name] > [dumpfilename.sql]

declare -r EXPORT_DB_HOST="${EXPORT_DB_HOST:-s1-dlapp07}" # Note this is the DB host to be "exported" from
declare -r EXPORT_DB_USER="${EXPORT_DB_USER:-rdcapp}"
declare -r EXPORT_DB_PASS="${EXPORT_DB_PASS:-321-rdc}"

declare -r EXPORT_DB_NAME="${EXPORT_DB_NAME:-case_framemf}"
declare -r DUMP_FILE="${DUMP_FILE:-${EXPORT_DB_NAME}.sql}"

mysqldump --host=${EXPORT_DB_HOST} --user=${EXPORT_DB_USER} --password=${EXPORT_DB_PASS} ${EXPORT_DB_NAME} > $DUMP_FILE
14:04:00 to 14:21:00 ==> 17 minutes

# Import
declare -r DB_NAME="${DB_NAME:-case_framemf}"

declare -r DB_HOST="${DB_HOST:-dlm47}" # Note this is the DB host to be "imported" into
declare -r DB_USER="${DB_USER:-rdcapp}"
declare -r DB_PASS="${DB_PASS:-321-rdc}"
declare -r DUMP_FILE="${DUMP_FILE:-${DB_NAME}.sql}"

$ mysql --port=3307 --host=dlm47 -urdcapp -p321-rdc

mysql -u username -ppassword databasename < filename.sql
(From: http://www.cyberciti.biz/faq/import-mysql-dumpfile-sql-datafile-into-my-database/)

mysql --port=3307  --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASS} \
      --verbose --batch --skip-column-names < $DUMP_FILE
==> --verbose is too noisy, --database is needed
mysql --port=3307  --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASS} --database=${DB_NAME} \
      --batch < $DUMP_FILE

14:57:50 to before 16:40

# Table Encryption [...](https://mariadb.com/kb/en/mariadb/table-encryption/)
