# MariaDB [Wiki](http://en.wikipedia.org/wiki/MariaDB)
After the 5.5 version, MariaDB developers decided to start a branch numbered 10, as an attempt to make it clear that MariaDB 10.0 will not import all features from MySQL 5.6; 

# Install
Download: https://downloads.mariadb.org/
Mint: https://downloads.mariadb.org/mariadb/repositories/#mirror=jmu&distro=Mint&distro_release=trusty--mint17_qiana&version=10.0
Linux x86_64: mariadb-10.0.19-linux-x86_64.tar.gz
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
./bin/mysqld_safe --datadir='/home/lplin/apps/mariadb-data' --defaults-file=~/.my.cnf &

--pid-file=file_name

# Installing MariaDB Alongside MySQL [...](https://mariadb.com/kb/en/mariadb/installing-mariadb-alongside-mysql/)