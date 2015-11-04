# Groups
[Capturing groups](http://www.javamex.com/tutorials/regular_expressions/capturing_groups.shtml#.Vi-AbicVhHw)

	filename = 'RIB_INX_RD03000T_20150129_4216221.xml'
	group = (filename =~ /RIB_INX_(\w+)_(\d+)_(\d+).xml/)
	if (group) { // RIB_INX_RD03000T_20150129_4216221.xml, RD03000T, 20150129, 4216221, 
	  group.each { sub ->
	    sub.each {
	      print "$it, "
	    }
	    println ''
	  }
	}
	else {
	  println "No match."
	}


# Tilde
sed -i -e "/^\[mysqld\]$/ s~\[mysqld\]~\[mysqld\]\n$DATADIR\n$BASEDIR\n$USER\n$PIDFILE~" /opt/mariadb-data/my.cnf

sed -i "s~^basedir=$~basedir=/opt/mariadb~"          /etc/rc.d/init.d/mariadb

[from](http://wiki.contribs.org/MariaDB_alongside_MySQL)

An address can be a line number, an increment given as a starting line number and a step amount separated by a tilde (~), the symbol $ (for last line), or a regular expression enclosed in slashes (/pattern/). 
[from](http://docstore.mik.ua/orelly/weblinux2/lian/ch12_02.htm)

