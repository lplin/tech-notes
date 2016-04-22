# Java 8 Nashorn Tutorial
From: <http://winterbe.com/posts/2014/04/05/java8-nashorn-tutorial/>

	import javax.script.ScriptEngine;
	import javax.script.ScriptEngineManager;
	import javax.script.ScriptException;

	public class NashornTester {
	    public static void main(String[] args) throws ScriptException {
	        ScriptEngine eng = new ScriptEngineManager().getEngineByName("nashorn");
	        eng.eval("print('Hello World!');");
	    }
	}

