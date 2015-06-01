# Debug remotely
IntelliJ Add an 'Remote'
Command line: -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005
Host: s1-dlapp08, port: 5005
Then start the Remote debug

# Full stack trace string [...](http://stackoverflow.com/questions/1149703/how-can-i-convert-a-stack-trace-to-a-string)
org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(Throwable)

# jstack PID > outfile
  $ sudo jstack -F 11824 > ws-10-22-thread-dump.log
	The thread dump is written to the system out of the VM on which you executed the kill -3. If you are redirecting the console output of the JVM to a file, the thread dump will be in that file. If the JVM is running in an open console, then the thread dump will be displayed in its console.

# [Jcraft](http://www.jcraft.com/jsch/examples/Shell.java.html)


