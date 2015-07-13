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

# 
Groovy automatically imports the following Java packages: java.lang , java.util , java.io , and java.net . It also imports the classes java.math.BigDecimal and java.math.BigInteger . In addition, the Groovy packages groovy.lang and groovy.util are imported.


# SQL
