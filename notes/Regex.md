# Tilde
sed -i -e "/^\[mysqld\]$/ s~\[mysqld\]~\[mysqld\]\n$DATADIR\n$BASEDIR\n$USER\n$PIDFILE~" /opt/mariadb-data/my.cnf

sed -i "s~^basedir=$~basedir=/opt/mariadb~"          /etc/rc.d/init.d/mariadb

[from](http://wiki.contribs.org/MariaDB_alongside_MySQL)

An address can be a line number, an increment given as a starting line number and a step amount separated by a tilde (~), the symbol $ (for last line), or a regular expression enclosed in slashes (/pattern/). 
[from](http://docstore.mik.ua/orelly/weblinux2/lian/ch12_02.htm)

