# Starting Groovy in listening mode:

    view sourceprint?
    $ groovy -l 9000 -e "println 'You say: ' + line"
    groovy is listening on port 9000

    $ telnet localhost 9000
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    Groovy Rocks!
    You say: Groovy Rocks! [ctrl + ] 
    telnet> quit
    Connection closed.


    groovy -l -p -e "new GroovyShell().evaluate(line)"
    lplin@dlm47 ~/rdc/tries/groovy/prog-groovy2 $ telnet localhost 1960
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    3.times { println it }
    ^]

    telnet> quit
    Connection closed.


# download failed issue (corrupted downloads)
	java.lang.RuntimeException: Error grabbing Grapes -- [download failed: org.freemarker#freemarker;2.3.19!freemarker.jar, download failed: commons-io#commons-io;2.0.1!commons-io.jar]
First:

	lplin@dlm47 ~/.m2/repository/org/freemarker $ rm -rf freemarker/2.3.19/
	lplin@dlm47 ~/.m2/repository/commons-io/commons-io $ rm -rf 2.0.1/

Then:
	lplin@dlm47 ~/.groovy/grapes $ rm -rf org.freemarker/
	lplin@dlm47 ~/.groovy/grapes $ rm -rf commons-io/

# Tutorial
- [Getting Started](http://groovy.codehaus.org/Tutorial+1+-+Getting+started)
- [Documentation](http://beta.groovy-lang.org/docs/latest/html/documentation/)
- [Groovy JDK] ( http://groovy.codehaus.org/groovy-jdk ).
- [Groovy with Eclipse - Tutorial](http://www.vogella.com/tutorials/Groovy/article.html#install_springgroovytools)


# By Default
Groovy automatically imports the following Java packages: java.lang , java.util , java.io , and java.net . It also imports the classes java.math.BigDecimal and java.math.BigInteger . In addition, the Groovy packages groovy.lang and groovy.util are imported.


# SQL
#!/usr/bin/env groovy
@GrabConfig(systemClassLoader=true)
@Grab(group='mysql', module='mysql-connector-java', version='5.1.18')
@Grab(group='com.rdc.app', module='rdc-web-common', version='0.1.8')

import groovy.sql.Sql
import static com.rdc.web.util.OneWayEncrypter.*

assert args.length == 4
def (db_host, db_user, db_pass, db_name) = args
println "jdbc:mysql://${db_host}:3306/${db_name}, " + db_user + ", " + db_pass
def db = Sql.newInstance("jdbc:mysql://${db_host}:3306/${db_name}", db_user, db_pass, 'com.mysql.jdbc.Driver')

println "user:"
db.eachRow('SELECT user_id, password FROM user;') { row ->
    userId = row['user_id']
    pwd = row['password']
    hash = createEncryptedPassword(pwd, Algorithm.SHA256);
    println "\t ${userId}: ${hash}"
    db.execute 'UPDATE user SET password_hash=? WHERE user_id=?', [hash, userId]
}

db.rows('select biz_unit_id from firm_config;').collect { it[0] }.each { bizUnitId ->
    table = "user_password_history_${bizUnitId}"
    q = "SELECT user_id, password, date FROM ${table};"
    println "${bizUnitId}:"
    db.eachRow(q.toString()) { row ->
        userId = row['user_id']
        pwd = row['password']
        hash = createEncryptedPassword(pwd, Algorithm.SHA256);
        println "\t ${userId}-'${row['date']}': ${hash}"
        db.execute "UPDATE ${table} SET password_hash=? WHERE user_id=? AND date=?", [hash, userId, row['date']]
    }
}
