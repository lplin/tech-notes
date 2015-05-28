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
	DROP DATABASE IF EXISTS case_framemf;
	CREATE DATABASE case_framemf /*!40100 DEFAULT CHARACTER SET latin1 */;

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

	mysql --host=localhost --user=${DB_USER} --password=${DB_PASS} --database=${DB_NAME} \
	      --batch < $DUMP_FILE
	11:45 12:43
# Table Encryption [...](https://mariadb.com/kb/en/mariadb/table-encryption/)

# Performance
MySQL 5.6.21

SELECT * FROM inquiry_3920 WHERE concatname LIKE 'LUIGI%'; -- Dur: 0.001 / Fetch: 0.002

SELECT aee.*, aea.*, i.* FROM inquiry_3920 i -- Dur: 0.169, Fetch: 3.164
INNER JOIN inquiry_disposition_3920 dis ON dis.inquiry_id=i.id
INNER JOIN alert_entity_3920 ae ON ae.inquiry_disposition_id=dis.id
LEFT OUTER JOIN alert_entity_attribute_3920 aea ON aea.alert_entity_id=ae.id
LEFT OUTER JOIN alert_entity_event_3920 aee ON aee.alert_entity_id=ae.id
WHERE country!='USA'AND aea.code='PTY' ;

SELECT BENCHMARK(1000000000,1+1); -- 19.505

select sql_no_cache * from inquiry_3920;
SHOW SESSION STATUS LIKE 'Select%';
SHOW STATUS LIKE 'last_query_cost'; -- 708999.799000

MariaDB 10.0.19

SELECT * FROM inquiry_3920 WHERE concatname LIKE 'LUIGI%'; -- Dur: 0.001 / Fetch: 0.003

SELECT aee.*, aea.*, i.* FROM inquiry_3920 i -- Dur: 0.056, Fetch: 0.281
INNER JOIN inquiry_disposition_3920 dis ON dis.inquiry_id=i.id
INNER JOIN alert_entity_3920 ae ON ae.inquiry_disposition_id=dis.id
LEFT OUTER JOIN alert_entity_attribute_3920 aea ON aea.alert_entity_id=ae.id
LEFT OUTER JOIN alert_entity_event_3920 aee ON aee.alert_entity_id=ae.id
WHERE country!='USA'AND aea.code='PTY' ;

SELECT BENCHMARK(1000000000,1+1); -- 22.921

set profiling=1;
select sql_no_cache * from inquiry_3920;
show profile;
FLUSH STATUS;
select sql_no_cache * from inquiry_3920;
SHOW SESSION STATUS LIKE 'Select%';
SHOW STATUS LIKE 'last_query_cost'; -- 702527.999000

# Encryption
Before, data can be seen
$ less view_query_4985.ibd
^@<9F><DC><F6><F0>J{<F2><91><A9>v<BB>5^@^@^@^C<FF><FF><FF><FF><FF><FF><FF><FF>^@^@^@^CJ|%
^VE<BF>^@^@^@^@^@^@^@^@^@^@^Ed^@ ^Y^?<80>~^@^@^@^@^Y[^@^B^@{^@|^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^N<E3>^@^@^Ed^@^@^@^B^@<F2>^@^@^Ed^@^@^@^B^@2^A^@^B^@^^infimum^@^E^@^K^@^@supremum^D^E^F^@^@^@^P^@-<80>^@^@^G^@^@^@^@s<AD><C0>^@^@^Af^A^P<80>^@^@^Gstringstageopen^F^E^F^@^@^@^X^@/<80>^@^@ ^@^@^@^@s<AD><C0>^@^@^Af^A^]<80>^@^@^Hstringstagepassed^F^E^F^@^@^@ ^@/<80>^@^@^K^@^@^@^@s<AD><C0>^@^@^Af^A*<80>^@^@    stringstagefailed^M^H^F^@^D^@(^@9<80>^@^@^]^@^@^@^@s<AD><C0>^@^@^Af^A7<80>^@^@ stringpendedBy@@currentUser^D^F^G^@^@^@0^@/<80>^@^@^^^@^@^@^@s<AD><C0>^@^@^Af
^AD<80>^@^@!booleanpendedtrue^E     ^G^@^@^@8^@3<80>^@^@"^@^@^@^@s<AD><C0>^@^@^Af^AQ<80>^@^@^GbooleaninProcessfalse^E       ^G^@^@^@@^@3<80>^@^@#^@^@^@^@s<AD><C0>^@^@^Af^A^<80>^@^@^HbooleaninProcessfalse^E       ^G^@^D^@H^@3<80>^@^@$^@^@^@^@s<AD><C0>^@^@^Af^Ak<80>^@^@        bool

# Key
[Table and tablespace encryption on MariaDB 10.1.3](https://blog.mariadb.org/table-and-tablespace-encryption-on-mariadb-10-1-3/)
mariadb@dlm47 /opt/mariadb-data $ openssl enc -aes-256-cbc -k xxx-1234 -P -md sha1
salt=292FAB246B0B78E3
key=5820CEE33E77D96EDA1EED0038610329A6DDA1299C031C51F8BFB3AC91638021
iv =0A27704DBD26F136E9252EA496F593DB
mariadb@dlm47 /opt/mariadb-data $ openssl enc -aes-256-cbc -k xxx-1234 -P -md sha1
salt=BCF2829F9009DCBC
key=16191C4A5CFAD9A28D8BE13384BE988B214512B42512F956C2011F04ACBB37D5
iv =83CE09D6F47246F1B4FA56BBDEA967DE
mariadb@dlm47 /opt/mariadb-data $ openssl enc -aes-256-cbc -k xxx-1234 -P -md sha1
salt=140381C0964A6F9D
key=29593D99E8958C5DCFB56C29C1D6FCA820211600C92D2503244EE4B8C57184F7
iv =CE3A3A8927BB69A56C49BF673436A3A7

# Cannot find file_key_management.so
Encryption of tables and tablespaces was added in MariaDB 10.1.3. There were substantial changes made in MariaDB 10.1.4, and the description below applies only to MariaDB 10.1.4 and later

https://downloads.mariadb.org/interstitial/mariadb-10.1.4/bintar-linux-x86_64/mariadb-10.1.4-linux-x86_64.tar.gz/from/http%3A//mirror.jmu.edu/pub/mariadb

https://mariadb.com/kb/en/mariadb/installing-mariadb-binary-tarballs/

Warning: World-writable config file '/opt/mariadb-data/my.cnf' is ignored
Installing MariaDB/MySQL system tables in './data' ...
./bin/mysqld: error while loading shared libraries: libjemalloc.so.1: cannot open shared object file: No such file or directory


sudo apt-get install libjemalloc1
==> OK

dlm47 init.d # chkconfig --add mariadb
chkconfig: command not found
==> [Chkconfig alternative for Ubuntu Server](http://askubuntu.com/questions/2263/chkconfig-alternative-for-ubuntu-server)

The equivalent to chkconfig is update-rc.d

The equivalents you seek are
update-rc.d <service> defaults
update-rc.d <service> start 20 3 4 5
update-rc.d -f <service>  remove


dlm47 init.d # update-rc.d mariadb defaults 
 Adding system startup for /etc/init.d/mariadb ...
   /etc/rc0.d/K20mariadb -> ../init.d/mariadb
   /etc/rc1.d/K20mariadb -> ../init.d/mariadb
   /etc/rc6.d/K20mariadb -> ../init.d/mariadb
   /etc/rc2.d/S20mariadb -> ../init.d/mariadb
   /etc/rc3.d/S20mariadb -> ../init.d/mariadb
   /etc/rc4.d/S20mariadb -> ../init.d/mariadb
   /etc/rc5.d/S20mariadb -> ../init.d/mariadb

# Before encryption
USE test;
CREATE TABLE user
SELECT 1 user_id, 'Jerry' user_name;
SELECT * FROM user;

@E ^] ^@^X<B8>~<B2><A5><D8>^\^@^@^@^C<FF><FF><FF><FF><FF><FF><FF><FF>^@^@^@^@^@^X<BE><B9>E<BF>^@
^@^@^@^@^@^@^@^@^@^@^D^@^B^@<9A><80>^C^@^@^@^@^@~^@^E^@^@^@^A^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^T^@^@^@^D^@^@^@^B^@<F2>^@^@^@^D^@^@^@^B^@2^A
^@^B^@ESCinfimum^@^B^@^K^@^@supremum^E^@^@^P<FF><F2>^@^@^@^@^B^@^@^@^@^@^O^H<88>^@^@^A:^A^P<80>^@^@^AJerry^

# After encryption
^@<F8><ED>.c^@^X<B9>40ύu^@^@^@^A^@^@^@^@^@^@^@^@^@^@^@^@^@^X<AC><A3>^@^E^@^@^@^A<8B><9D>%<A7>^@^@^@^D<ED><E1>Ah1<B6>ESC1pHƘ^F<A8><AF><D8>s<EF><F5>#<83>k<FB>av<BB>~<B0><99><A6><80>Β0~<95>^D<C0><95>Yf<F8>{.<A8>̱<9A><AC>Ȼ^]<AD>^K<AE>Y_<B6><EF>m<9C><F8>n<U+07BC>^\d<E9><D3>$jiv<B8><9B><91>J<A0><9B><8F>1Un<EF>f<BE><F0><D4>=^\{{H
<U+07B3>vG^Y<E9>^K<A5><9F>^C<F5><BF><EE>v<95>^Z0N$5<DD>Tq<8F>;^Y<97><9B>J^^z+ܶ<97><ED><9A>d^\<9F><9D><E5><C9><C7><ED>Sg<B1>n<A2>G;R0<8C><92>
<E7><AB>^N$a]^R'p<AF><AC>^Xٕ^Gd/u<FD>^M_o<CB>^N;p^_^A^E<E8>^A<81><C4><F6>^T^S0^A<D7>@8<CA>ϒ<F6>^S^K<D2>{<8A><99><A1>lESC<88><E7>n
<B1>^S<EB><F6>^^<U+077C><B9><E1>'><A2>?<99>A<D6>5<U+0777>Օ<9B>x<95> B<93><D2>~<D9>R\<B9>IJ}<A8>X<BC>-T<E7><BA>)<A6><81>Uo<D2>^Ad$k<B7>/<C4>RQ<E0><CA>O-È<85>^V<AD>+<9F><C4>&o<EA>$K<D4>^M6<FF>  O<BC><A3>ڎ5@~<83>ɾ<93><F0><E9><F4><U+077D><E9>" <94>^]<D8>ȣ<EB>V&<AC>0<99><C9>l<AD><AC>]j^Z]Y<<92>}<AE>8^Be<EB>(g<AF><A6>p
1^Y<A4>P^V<F8><EF><F9><B4>W*<E0>bX<CA><EE>?<BE><U+0380><AA><C9>:<BB>Ϋ^Zж<B9>p<U+DE14D>^S<D0>D<BA>
^O<D7>  <BC>^C<CD><EB>Nm<C5>9<FD>]<99>^L<FB>

# With innodb-encrypt-log option
150521 16:47:09 mysqld_safe Starting mysqld daemon with databases from /opt/mariadb-data
150521 16:47:09 mysqld_safe WSREP: Running position recovery with --log_error='/opt/mariadb-data/wsrep_recovery.UNnfct' --pid-file='/opt/mariadb-data/dlm47-recover.pid'
150521 16:47:10 mysqld_safe WSREP: Failed to recover position: '150521 16:47:09 [Note] InnoDB: Using mutexes to ref count buffer pool pages
150521 16:47:09 [Note] InnoDB: The InnoDB memory heap is disabled
150521 16:47:09 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
...

150521 16:47:09 [Note] InnoDB: Redo log crypto: unencrypted key ver.
150521 16:47:09 [ERROR] InnoDB: Tablespace id 4 encrypted but encryption service not available. Can't continue opening tablespace.

2015-05-21 16:47:09 7fb592ede7c0  InnoDB: Assertion failure in thread 140417830873024 in file ha_innodb.cc line 21064
InnoDB: We intentionally generate a memory trap.
InnoDB: Submit a detailed bug report to http://bugs.mysql.com.
InnoDB: If you get repeated assertion failures or crashes, even
InnoDB: immediately after the mysqld startup, there may be
InnoDB: corruption in the InnoDB tablespace. Please refer to
InnoDB: http://dev.mysql.com/doc/refman/5.6/en/forcing-innodb-recovery.html
InnoDB: about forcing recovery.
150521 16:47:09 [ERROR] mysqld got signal 6 ;
This could be because you hit a bug. It is also possible that this binary
or one of the libraries it was linked against is corrupt, improperly built,
or misconfigured. This error can also be caused by malfunctioning hardware.

To report this bug, see http://kb.askmonty.org/en/reporting-bugs

We will try our best to scrape up some info that will hopefully help
diagnose the problem, but since we have already crashed, 
something is definitely wrong and this may fail.

Server version: 10.1.4-MariaDB-wsrep-log
key_buffer_size=16777216
read_buffer_size=262144
max_used_connections=0
max_threads=153
thread_count=0
It is possible that mysqld could use up to 
key_buffer_size + (read_buffer_size + sort_buffer_size)*max_threads = 137126 K  bytes of memory
Hope that's ok; if not, decrease some variables in the equation.

Thread pointer: 0x0x0
Attempting backtrace. You can use the following information to find out
where mysqld died. If you see no messages after this, something went
terribly wrong...
stack_bottom = 0x0 thread_stack 0x48000
mysys/stacktrace.c:247(my_print_stacktrace)[0xbcf42e]
sql/signal_handler.cc:153(handle_fatal_signal)[0x74cde4]
/lib/x86_64-linux-gnu/libpthread.so.0(+0x10340)[0x7fb592ad9340]
/lib/x86_64-linux-gnu/libc.so.6(gsignal+0x39)[0x7fb5916b4bb9]
/lib/x86_64-linux-gnu/libc.so.6(abort+0x148)[0x7fb5916b7fc8]
handler/ha_innodb.cc:21064(ib_logf(ib_log_level_t, char const*, ...))[0x8d7328]
fil/fil0fil.cc:2042(fil_read_first_page(int, unsigned long, unsigned long*, unsigned long*, unsigned long*, unsigned long*, unsigned long, fil_space_crypt_struct**))[0xa536bc]
fil/fil0fil.cc:3741(fil_open_single_table_tablespace(bool, bool, unsigned long, unsigned long, char const*, char const*))[0xa61f3f]
dict/dict0load.cc:1173(dict_check_tablespaces_and_store_max_id(dict_check_t))[0xa40ff7]
srv/srv0start.cc:2597(innobase_start_or_create_for_mysql())[0x9ae7e5]
handler/ha_innodb.cc:4085(innobase_init)[0x8df801]
sql/handler.cc:512(ha_initialize_handlerton(st_plugin_int*))[0x75103e]
sql/sql_plugin.cc:1403(plugin_initialize)[0x5b6190]
sql/sql_plugin.cc:1675(plugin_init(int*, char**, int))[0x5b71b1]
sql/mysqld.cc:5039(init_server_components)[0x5157c2]
sql/mysqld.cc:5631(mysqld_main(int, char**))[0x516f30]
/lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf5)[0x7fb59169fec5]
/opt/mariadb/bin/mysqld[0x50c9d9]
The manual page at http://dev.mysql.com/doc/mysql/en/crashing.html contains
information that should help you find out what is causing the crash.'

==> Sounds resulted from innodb-encrypt-log option. Bug? [MDEV-8021](https://mariadb.atlassian.net/browse/MDEV-8021) or [MDEV-8011](https://mariadb.atlassian.net/browse/MDEV-8011)

Source: [innodb_first_page.test](https://github.com/MariaDB/server/blob/16b6ec2e377f8f3dcac76e8c172ed9daa797d311/mysql-test/suite/encryption/t/innodb_first_page.test)
[History](https://github.com/MariaDB/server/commits/20c23048c1d2f28942f2f99e4150a58b6545c0cd/storage/innobase/handler/ha_innodb.cc)
Search by filename: [filename:.ha_innodb.cc](https://github.com/MariaDB/server/search?utf8=%E2%9C%93&q=filename%3A.ha_innodb.cc+&type=Code)
[MDEV-8015 InnoDB: Failing assertion: new_state->key_version != ENCRYP…](https://github.com/MariaDB/server/commit/a583976e78298141e074c2a6b3d6c7c842642781)

== [fil0fil.cc](https://github.com/MariaDB/server/blob/536112dd30bbe68e1b0624ed68fbf96e333d9f80/storage/innobase/fil/fil0fil.cc)
	if ((cdata && cdata->encryption == FIL_SPACE_ENCRYPTION_ON) ||
		(srv_encrypt_tables &&
			cdata && cdata->encryption == FIL_SPACE_ENCRYPTION_DEFAULT)) {

		if (!encryption_key_id_exists(cdata->key_id)) {
			ib_logf(IB_LOG_LEVEL_FATAL,
				"Tablespace id %ld encrypted but encryption service"
				" not available. Can't continue opening tablespace.\n",
				space);
			ut_error;
		}
	}


SHOW VARIABLES LIKE 'innodb_enc%';
# Variable_name, Value
innodb_encrypt_log, OFF
innodb_encrypt_tables, OFF
innodb_encryption_rotate_key_age, 1
innodb_encryption_rotation_iops, 100
innodb_encryption_threads, 0


# Another work through [...](https://mattwservices.co.uk/threads/table-and-tablespace-encryption-on-mariadb-10-1-3.1804/)

# Install is required otherwise 
==> [ERROR] Could not open mysql.plugin table. Some plugins may be not loaded

scripts/mysql_install_db --defaults-file=/opt/mariadb-data/my.cnf

mariadb@dlm47 ~ $ bin/mysql_secure_installation --defaults-file=/opt/mariadb-data/my.cnf --basedir='/opt/mariadb' --datadir='/opt/mariadb-data' 

Alternatively you can run:
'/opt/mariadb/bin/mysql_secure_installation'
==> bin/mysql_secure_installation --defaults-file=/opt/mariadb-data/my.cnf --basedir='/opt/mariadb' --datadir='/opt/mariadb-data' 
==> bin/mysql_secure_installation --port=3307 -h dlm47


which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the MariaDB Knowledgebase at http://mariadb.com/kb or the
MySQL manual for more instructions.

You can start the MariaDB daemon with:
cd '/opt/mariadb' ; /opt/mariadb/bin/mysqld_safe --datadir='/opt/mariadb-data'
==> /opt/mariadb/bin/mysqld_safe --basedir='/opt/mariadb' --datadir='/opt/mariadb-data' --defaults-file='/opt/mariadb-data/my.cnf'

You can test the MariaDB daemon with mysql-test-run.pl
cd '/opt/mariadb/mysql-test' ; perl mysql-test-run.pl

# DB Ops
	SELECT * from mysql.user;
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('321-rdc');

	SHOW VARIABLES LIKE 'skip_networking'; -- OFF
	SHOW VARIABLES LIKE 'secure-auth'; -- Empty
	SET secure-auth='OFF';
	SET skip_networking='OFF';

	DROP USER 'rdcapp'@'dlm47';

	DROP USER ''@'dlm47';

	SELECT * from mysql.user WHERE host='localhost' AND user='';

	DELETE from mysql.user WHERE host='localhost' AND user='';

	SELECT * FROM information_schema.USER_PRIVILEGES;
	SELECT * from mysql.user;

	CREATE USER 'rdcapp'@'%' IDENTIFIED BY '321-rdc';
	GRANT ALL PRIVILEGES ON *.* TO 'rdcapp'@'%' WITH GRANT OPTION;

	GRANT ALL PRIVILEGES ON *.* TO 'rdcapp'@'dlm47' WITH GRANT OPTION;

	SELECT * from information_schema.user_privileges where grantee like "'rdcapp'%";
	FLUSH PRIVILEGES;

	USE test;
	CREATE TABLE user
	SELECT 1 user_id, 'Jerry' user_name;

	SELECT * FROM user;

	CREATE TABLE user1
	SELECT 1 user_id, 'Jim' user_name;
	SELECT * FROM user1;

	CREATE TABLE t1 (user_id int, user_name varchar(255)) ENCRYPTED=YES ENCRYPTION_KEY_ID=1;
	INSERT INTO t1
	SELECT 1 user_id, 'Jerry' user_name;


	SELECT * FROM t1;


	SHOW VARIABLES LIKE 'innodb_enc%';

	CREATE DATABASE db1;
	USE db1;
	CREATE TABLE user
	SELECT 1 user_id, 'Jerry' user_name;
	SELECT * FROM user;


# Import after encrypted:
	DROP DATABASE IF EXISTS case_framemf;
	CREATE DATABASE case_framemf /*!40100 DEFAULT CHARACTER SET latin1 */;

	declare -r DB_NAME="${DB_NAME:-case_framemf}"

	declare -r DB_HOST="${DB_HOST:-dlm47}" # Note this is the DB host to be "imported" into
	declare -r DB_USER="${DB_USER:-rdcapp}"
	declare -r DB_PASS="${DB_PASS:-321-rdc}"
	declare -r DUMP_FILE="${DUMP_FILE:-${DB_NAME}.sql}"

	mysql --port=3307  --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASS} --database=${DB_NAME} \
	      --batch < $DUMP_FILE
MySQL 5.6 duration 1 hour:

	$ ls -lart /var/lib/mysql/case_management
	-rw-rw---- 1 mysql mysql         65 May 19 11:42 db.opt
	-rw-rw---- 1 mysql mysql       8920 May 19 11:46 alert_entity_3320.frm
	...
	-rw-rw---- 1 mysql mysql 1774190592 May 19 12:40 audit_3920.ibd

MariaDB almost 2 hours after encrypted

		$ /opt/mariadb-data/case_framemf $ ls -lart
		-rw-rw---- 1 mariadb mariadb         65 May 22 17:35 db.opt
		-rw-rw---- 1 mariadb mariadb       2451 May 22 17:36 alert_entity_3320.frm
		...
		-rw-rw---- 1 mariadb mariadb   79691776 May 22 19:24 audit_4495.ibd

DB ops

	SELECT * FROM mysql.user;
	SELECT * FROM information_schema.USER_PRIVILEGES;

	USE test;
	CREATE TABLE user
	SELECT 1 user_id, 'Jerry' user_name;
	SELECT * FROM user;

	DROP TABLE test;
	DROP DATABASE case_framemf;

	CREATE DATABASE case_framemf /*!40100 DEFAULT CHARACTER SET latin1 */;

lplin@dlm47 ~ $ sudo -u mysql -s	
mysql@dlm47 /home/mysql/case_framemf $ hexdump -C view_query_base.ibd 
mariadb@dlm47 /opt/mariadb-data/case_framemf $ hexdump -C view_query_base.ibd > /tmp/view_query_base.ibd.mariadb.hexdump


lplin@dlm47 ~/data/mariadb $ meld view_query_base.ibd.mysql56.hexdump view_query_base.ibd.mariadb.hexdump 

# Working my.cnf
	# The MariaDB server
	[mysqld]
	# skip-grant-tables
	# skip-secure-auth
	# Tablespace encryption configuration
	plugin-load-add=example_key_management.so
	example_key_management
	#example_key_management_encryption_algorithm=aes_cbc
	# encrypt Aria tables
	#aria
	#aria-encrypt-tables
	innodb-encrypt-tables
	# encrypt tmp tables
	encrypt-tmp-disk-tables
	# encrypt InnoDB log files
	innodb-encrypt-log
	# key rotation
	innodb-encryption-threads=4
	innodb-encryption-rotate-key-age=1800

	datadir         = /opt/mariadb-data
	basedir         = /opt/mariadb
	user            = mariadb
	pid-file	= /opt/mariadb-data/mariadb.pid
	port		= 3307
	socket		= /opt/mariadb-data/mariadb.sock

# Performance after encrypted
SELECT BENCHMARK(1000000000,1+1); -- 32.132 sec first time, around 23 the 2nd and 3rd time vs MySQL 5.6.21: 19.505, No Enc: 22.921
