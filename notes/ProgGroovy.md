# Get Started:
## Install
Download from <http://groovy-lang.org/download.html>.
[snapshot release]()

## Managing Versions
curl -s get.gvmtool.net | bash  (use jre 1.7 or above)
gvm install groovy

==> Moved to [sdkman](http://sdkman.io/)

	$ curl -s http://get.sdkman.io | bash

	lplin@dlm47 ~ $ sdk list groovy

	================================================================================
	Available Groovy Versions
	================================================================================
	     2.4.4                2.3.1                2.0.8                1.8.3          
	     ...
	     2.3.11             * 2.1.1                1.8.5                1.7.10         
	================================================================================
	+ - local version
	* - installed
	> - currently in use
	================================================================================

## Groovy SH
	String.metaClass.isPalindrome = {
	  delegate == delegate.reverse()
	}
	'mom'.isPalindrome()

	$ groovysh
	Groovy Shell (2.1.1, JVM: 1.6.0_45)
	Type 'help' or '\h' for help.
	------------------------------------
	groovy:000> 

	groovy:000> Math.sqrt(16)
	===> 4.0
	groovy:000> println 'Test drive Groovy'
	Test drive Groovy
	===> null
	groovy:000> String.metaClass.isPalindrome = {
	groovy:001>
	delegate == delegate.reverse()
	groovy:002> }
	===> groovysh_evaluate$_run_closure1@64b99636
	groovy:000> 'mom'.isPalindrome()
	===> true
	groovy:000> 'mom'.l<tab>
	lastIndexOf(
	leftShift(
	groovy:000> 'mom'.

	groovy:000> load tmp/h1.groovy
	Hello Grovvy 123!
display   (\d ) Display the current buffer. This only displays the buffer of an incomplete expression. Once the expression is complete, the buffer is rest. The prompt will update to show the size of the current buffer as well.

	groovy:000> class Foo {
	groovy:001>   def bar
	groovy:002>   def baz() {
	groovy:003> \d
	 000> class Foo {
	 001>   def bar
	 002>   def baz() {
	groovy:003> \s tmp/g2.groovy



## groovyConsole


## Command Line
>$ cat > Hello.groovy
>> println "Hello Groovy!"

>$ groovy Hello
>> Hello Groovy!

>$ groovy -e "println 'hello'"

>$ groovy -e 'println Math.sqrt(25)' (slow because of loading JVM)

## IDE
- [Groovy with Eclipse - Tutorial](http://www.vogella.com/tutorials/Groovy/article.html#install_springgroovytools)
- [Groovy Eclipse Wiki](https://github.com/groovy/groovy-eclipse/wiki): [Groovy-Eclipse e4.4](http://dist.springsource.org/release/GRECLIPSE/e4.4)

# Groovy for Java Eyes
## From Java to Groovy
### Default Imports
We don’t have to import all the common classes/packages when we write Groovy code. For example, Calendar readily refers to java.util.Calendar . Groovy automatically imports the following Java packages: 
- java.lang, java.util , java.io , and java.net . 
- It also imports the classes java.math.BigDecimal and java.math.BigInteger.
- In addition, the Groovy packages groovy.lang and groovy.util are imported.

### Loops
	0.upto(2) { println it }
	3.times { println it }
	0.step(10, 2) { print " $it" } // 0 2 4 6 8

	String[] greetings = ["Hello", "Hi", "Howdy"]
	for(def greet : greetings) { println greet } // Groovy insists that we specify the type in the Java style for-each.
	for(greet in greetings) { println greet } // In Groovy we prefer for with in	

### Exec
	println "ps -ef".execute().text
	println "groovy -v".execute().text

### Safe-navigation operator: eliminates the mundane check for null
def str
//str = "abc"
//if (str != null) { str.reverse() }
println "str?.reverse(): " + str?.reverse()
==> str?.reverse(): null

###  Exception
Groovy does not force us to handle exceptions that we don’t want to handle or that are inappropriate at the current level of code. Any exception we don’t handle is automatically passed on to a higher level.

	def openFile(fileName) {
	  new FileInputStream(fileName)
	}

	try {
	  openFile("nonexistentfile")
	} catch (e) {
	  println "Oops: " + e
	}

	openFile("nonexistentfile")

### As Lightweight Java
- Optional: return statement, semicolon ( ; ), catch exceptions, tailing parameters:  
  `def log(x, base=10) { Math.log(x) / Math.log(base) }`
- By default: Methods and classes are public
- Initialize JavaBeans using named parameters
- ?. operator dispatches calls only if the object reference is not null.
- use this within static methods to refer to the Class object.
 
		class Wizard {
			def static learn(trick, action) {
				//...
				this
			}
		}
		Wizard.learn('alohomora', {/*...*/})
		.learn('expelliarmus', {/*...*/})
		.learn('lumos', {/*...*/})


## JavaBeans

	class Car {
	  def miles = 0
	  final year
	  Car(theYear) { year = theYear }
	}

	def car = new Car(2012)

	println "Year: $car.year"
	println "Miles: $car.miles"
	println  'Driving'
	car.drive(10)
	println "Miles: $car.miles"

	try {
	  print 'Can I set the year? '
	  car.year = 1900
	} catch(groovy.lang.ReadOnlyPropertyException ex) {
	  println ex.message // Cannot set readonly property: year for class: Car
	}

	try {
	  print 'Can I set the miles? '
	  car.miles = 12 // Result: 12
	} catch(IllegalAccessException ex) {
	  println ex.message
	}

	Calendar.instance
	// instead of Calendar.getInstance()
	str = 'hello'

	str.class.name
	// instead of str.getClass().getName()

	// Caution: Won't work for Maps, Builders,...
	// use str.getClass().name to be safe

Map assumes that the name class refers to a (nonexistent) key and returns a null value.	

	langs = ['C++' : 'Stroustrup', 'Java' : 'Gosling', 'Lisp' : 'McCarthy']
	println 'langs.getClass().name:' + langs.getClass().name // java.util.LinkedHashMap
	println 'langs.class: ' + langs.class // null
	langs.class = 'The value of key "class"'
	println 'langs.class: ' + langs.class

Use caution with the class property, however—some classes, like Map , and builders give special treatment to this property (see Section 6.5, Using the Map Class, on page 118, for example). As a result, in general, use getClass() instead of class to avoid any surprises.

## Flexible Initialization and Named Arguments
	class Robot {
	  def type, height, width
	  def access(location, weight, fragile) {
	    println "Received fragile? $fragile, weight: $weight, loc: $location"
	  }
	}
When constructing an object, simply give values for properties as comma-separated name-value pairs. This is a post-construction operation if our class has a no-argument constructor:

	robot = new Robot(type: 'arm', width: 10, height: 40)

	println "$robot.type, $robot.height, $robot.width" ==>  arm, 40, 10
We can also design our methods so they can take named arguments. To take advantage of this feature, define the first parameter as a Map:

	def printProps(p, str='abc') {
	  println "x=${p.x}, y=${p.y}, z=${p.z}, str=${str}"
	}

	printProps(y: 2, z: 3, x:1)
	printProps(y: 2, z: 3, x:1, 'aaa')
	printProps('bbb', z: 3, y: 2, x:1)
	// printProps(1, 2, 3, 'cc') // No signature of method:

	def printProps1(p, p1) {
	  println "x=${p.x}, y=${p.y}, z=${p.z}, p1=${p1}"
	}
	printProps1(y: 2, z: 3, x:1, [a: 'a'])

	robot.access(x: 30, y: 20, z: 10, 50, true) ==>   Received fragile? true, weight: 50, loc: [x:30, y:20, z:10]

	//You can change the order
	robot.access(50, true, x: 30, y: 20, z: 10) ==>   Received fragile? true, weight: 50, loc: [x:30, y:20, z:10]

If the number of arguments we send is greater than the number of parameters the method expects and if the excess arguments are name-value pairs, then Groovy assumes the method’s first parameter is a Map and groups all the name-value pairs in the arguments together as values for the first parameter. It then takes the rest of the arguments, in the presented order, as values for the remaining parameters, as we saw in the output.

==> it can get confusing, so use it sparingly. If we desire named arguments, then it’s better to simply accept one Map parameter and not mix different parameters.

## Optional Parameters
We can make as many parameters optional as we like, but they have to be trailing. To define an optional parameter, simply give it a value in the parameter list.

	def log(x, base=10) {
	Math.log(x) / Math.log(base)
	}
	println log(1024)

Groovy also treats the trailing array parameter as optional:

	def task(name, String[] details) {
	  println "$name - $details"
	}
	task 'Call', '123-456-7890' // ==> Call - [123-456-7890]
	task 'Call', '123-456-7890', '231-546-0987' // ==> Call - [123-456-7890, 231-546-0987]
	task 'Check Mail' // ==>  Check Mail - []

## Multiple Assignments
	def splitName(fullName) { fullName.split(' ') }
	def (firstName, lastName) = splitName('James Bond')
	println "$lastName, $firstName $lastName"

	(firstName, lastName) = ['Jerry', 'Lin']
	println "$lastName, $firstName $lastName"

If we have excess variables, Groovy will set them to null:

	def (first, second, third) = ['Tom', 'Jerry']
	println "$first, $second, and $third" // ==> Tom, Jerry, and null
and excess values will be discarded:

	def (String cat, String mouse) = ['Tom', 'Jerry', 'Spike', 'Tyke']
	println "$cat and $mouse"

If the excess variable is a primitive type, something that can’t be set to null, then Groovy will throw an exception—this is a new behavior. int is treated as a primitive where possible, and not as an Integer in Groovy 2.x:

	def (str, int num) = ['Abc'] ==>  org.codehaus.groovy.runtime.typehandling.GroovyCastException: Cannot cast object 'null' with class 'null' to class 'int'. Try 'java.lang.Integer' instead
    def (str, Integer num) = ['Abc'] ==> OK

## Interfaces
	button.addActionListener({ JOptionPane.showMessageDialog(frame, "You clicked!") } as ActionListener)

Groovy does not force us to implement all the methods in an interface; we can define only the methods we care about and leave out the rest. If the methods left out are never called, then we didn’t waste any effort implementing them. This technique is quite useful when implementing interfaces to mock up some behavior during unit testing.

	handleFocus = [
		focusGained : { msgLabel.setText("Good to see you!") },
		focusLost : { msgLabel.setText("Come back soon!") }
	]
	button.addFocusListener(handleFocus as FocusListener)
The as operator is good if we know the name of the interface we’re implementing, but what if our application demands dynamic behavior and we’ll know the interface name only at runtime? The asType() method comes to our rescue. We can dynamically add handlers for multiple events using a single block of code. Here’s how:

	events = ['WindowListener', 'ComponentListener']
	// Above list may be dynamic and may come from some input
	handler = { msgLabel.setText("$it") }
	for (event in events) {
		handlerImpl = handler.asType(Class.forName("java.awt.event.${event}"))
		frame."add${event}"(handlerImpl)
	}

Check [GroovyForJavaEyes/Swing.groovy](http://media.pragprog.com/titles/vslg2/code/GroovyForJavaEyes/Swing.groovy)

## Boolean Evaluation
| Type           | Condition for Truth   |
|----------------|-----------------------|
| Boolean        | True                  |
| Collection     | Not empty             |
| Character      | Value not 0           |
| CharSequence   | Length greater than 0 |
| Enumeration    | Has more elements     |
| Iterator       | Has next              |
| Number         | Double value not 0    |
| Map            | Not empty             |
| Matcher        | At least one match    |
| Object[]       | Length greater than 0 |
| Any other type | Reference not null    |

	str = 'hello'
	if (str) { println 'hello' }

	lst0 = null
	println lst0 ? 'lst0 true' : 'lst0 false' // false
	lst1 = [1, 2, 3]
	println lst1 ? 'lst1 true' : 'lst1 false' // true
	lst2 = []
	println lst2 ? 'lst2 true' : 'lst2 false' // false

## Operator Overloading
String: Groovy adds other convenience methods to String: plus() ( + ), multiply() ( * ), next() ( ++ ), replaceAll() , and tokenize()...

	for (ch in 'a'..'c') { // This operator maps to the next() method on the String class to produce this output
	  println ch
	}

    for(str in 'held'..'helf') { println str } // held hele helf 
To add an element to a collection, we can use the << operator, which translates to the Groovy-added leftShift() method on Collection:

	println (['hello'] << 'there') // [hello, there]

provide operators for our own classes by adding the mapping methods, such as plus() for + .

	class ComplexNumber {
	  def real, imaginary
	  def plus(other) { new ComplexNumber(real: real + other.real, imaginary: imaginary + other.imaginary) }
	  String toString() { "$real ${imaginary > 0 ? '+' : ''} ${imaginary}i"}
	}
	println new ComplexNumber(real: 1, imaginary: 2) + new ComplexNumber(real: 4, imaginary: 1) // 5 + 3i

## Java 5 Language Features
### Enum
	enum CoffeeSize { SHORT, SMALL, MEDIUM, LARGE, MUG }
	def orderCoffee(size) {
	    print "Coffee order received for size $size: "
	    switch(size) {
	        case [CoffeeSize.SHORT, CoffeeSize.SMALL]:
	            println "you're health conscious"
	            break
	        case CoffeeSize.MEDIUM..CoffeeSize.LARGE:
	            println "you gotta be a programmer"
	            break
	        case CoffeeSize.MUG:
	            println "you should try Caffeine IV"
	            break
	        }
	    }
	orderCoffee(CoffeeSize.SMALL) // you're health conscious
	orderCoffee(CoffeeSize.LARGE) // you gotta be a programmer
	orderCoffee(CoffeeSize.MUG) // you should try Caffeine IV
	print 'Available sizes are: '
	for(size in CoffeeSize.values()) {
	  print "$size "
	}

### Varargs:
	def receiveVarArgs(int a, int... b) {
	  println "You passed $a and $b"
	}
	def receiveArray(int a, int[] b) {
	  println "You passed $a and $b"
	}
	receiveVarArgs(1, 2, 3, 4, 5) // You passed 1 and [2, 3, 4, 5]
	receiveArray(1, 2, 3, 4, 5) // You passed 1 and [2, 3, 4, 5]
Use caution when we send an array instead of discrete values. Groovy treats the values wrapped in square brackets [] as an instance of ArrayList	

	int[] values = [2, 3, 4, 5]
	receiveVarArgs(1, values) // Same
	receiveVarArgs(1, [2, 3, 4, 5] as int[]) // Same
	receiveVarArgs(1, [2, 3, 4, 5]) // MissingMethodException: No signature of method: (java.lang.Integer, java.util.ArrayList)

### Annotations:
- The syntax for defining in Groovy is the same as in Java.
- JUnit 4.0 uses the @Test annotation. If we’re using frameworks like Hibernate, JPA, Seam, Spring, and so on, we’ll find Groovy’s support for annotations quite helpful.
- The Groovy compiler does not treat the Java compilation-related annotations the same way the Java compiler does. For example, groovyc ignores @Override .

### Static Import:
We can define aliases in Groovy—for both static methods and class names.

import static Math.random as rand
import groovy.lang.ExpandoMetaClass as EMC
double value = rand()
def metaClass = new EMC(Integer)
assert metaClass.getClass().name == 'groovy.lang.ExpandoMetaClass'

### Generics
However, the Groovy compiler does not perform type-checking the same way the Java compiler does. Groovy’s dynamic typing will interplay here with generic types to get our code running, if possible.

ArrayList<Integer> list = new ArrayList<Integer>();
list.add(1);
list.add(2.0);
list.add("hello"); // OK
System.out.println("List populated");
for(int element : list) { System.out.println(element); } // GroovyCastException: Cannot cast object 'hello' with class 'java.lang.String' to class 'int'

## Code-Generation Transformations
### @Canonical transformation
	import groovy.transform.*
	@Canonical(excludes="lastName, age")
	class Person { 
	  String firstName, lastName
	  int age 
	  // def firstName, lastName, age // Would show everything
	}
	println new Person(firstName: "Sara", lastName: "Walker", age: 49)

### @Delegat
Groovy simply routes a call to the method on the instance:

	class Worker {
	    def work() { println 'get work done' }
	    def analyze() { println 'analyze...' }
	    def writeReport() { println 'get report written' }
	}

	class Expert {
	    def analyze() { println "expert analysis..." }
	}

	class Manager {
	    @Delegate Expert expert = new Expert()
	    @Delegate Worker worker = new Worker()
	}

	def bernie = new Manager()
	bernie.analyze()
	bernie.work()
	bernie.writeReport()

If we add or remove methods to the Worker or the Expert class, we don’t have to make any changes to Manager for the corresponding change to take effect. Simply recompile the code, and Groovy takes care of the rest.

### @Immutable
Immutable objects are inherently thread-safe, and it is a good practice to mark fields as final (as a bonus).

	import groovy.transform.*
	@Immutable
	class CreditCard {
	    String cardNumber
	    int creditLimit
	}
	println new CreditCard("4000-1111-2222-3333", 1000) // CreditCard(4000-1111-2222-3333, 1000)

Groovy rewards our gesture by providing us with a constructor where parameters appear **in the order of the fields**. The fields can’t be changed after the construction time. In addition, Groovy adds the hashCode() , equals() , and toString() methods.

### @Lazy
	class Heavy {
	  def size = 10
	  Heavy() { println "Creating Heavy with $size" }
	}
	class AsNeeded {
	  def value
	  @Lazy Heavy heavy1 = new Heavy()
	  @Lazy Heavy heavy2 = { new Heavy(size: value) }()
	  AsNeeded() { println "Created AsNeeded" }
	}

	def asNeeded = new AsNeeded(value: 1000) // Created AsNeeded
	println asNeeded.heavy1.size // Creating Heavy with 10\n 10
	println asNeeded.heavy1.size // 10
	println asNeeded.heavy2.size // Creating Heavy with 10\n 1000

Groovy not only defers the creation, but also marks the field as **volatile** and ensures **thread safety** during creation. The instances are created on the first access to the fields. The @Lazy annotation provides a painless way to implement the virtual proxy pattern with thread safety as a bonus.

### @Newify
The Ruby-style constructor:

	class Dog  
	  def initialize(breed, name)  
	    # Instance variables  
	    @breed = breed  
	    @name = name  
	  end  

	  def display  
	    puts "I am of #{@breed} breed and my name is #{@name}"  
	  end  
	end  
	Dog.new('Labrador', 'Benzy').display

The Python-like constructor:

	#!/usr/bin/python
	class Employee:
	   'Common base class for all employees'
	   empCount = 0

	   def __init__(self, name, salary):
	      self.name = name
	      self.salary = salary
	      Employee.empCount += 1
	   
	   def displayCount(self):
	     print "Total Employee %d" % Employee.empCount

	   def displayEmployee(self):
	      print "Name : ", self.name,  ", Salary: ", self.salary

	emp1 = Employee("Zara", 2000)
	emp1.displayEmployee()
	Employee("Manni", 5000).displayCount()

In Groovy to improve the fluency when creating DSLs:
	import groovy.transform.*

	@Canonical(excludes="lastName, age")
	class Person { String firstName, lastName; int age; }

	@Immutable
	class CreditCard { String cardNumber; int creditLimit }

	@Newify([Person, CreditCard])
	def fluentCreate() { // Compilation error if not providing the method to annotate, can be at class level
	  println Person.new(firstName: "John", lastName: "Doe", age: 20)
	  println Person(firstName: "John", lastName: "Doe", age: 20)
	  println CreditCard("1234-5678-1234-5678", 2000)
	}

	fluentCreate()
	// println Person(firstName: "John", lastName: "Doe", age: 20) // MissingMethodException: No signature of method

### @Singleton: Generate the static getInstance() method while ensuring thread-safe with lazy creation of the singleton

	import groovy.transform.*

	@Singleton(lazy = true) class TheUnique { private TheUnique() { println 'Instance created' }; def hello() { println 'hello' }}

	println "Accessing TheUnique"
	TheUnique.instance.hello() // Instance created\n hello
	TheUnique.instance.hello() // hello

Examine the generated code by `script > Inspect AST` menu item. With `At end of Phase`: `Class Generation` or `Output`

	@groovy.lang.Singleton(lazy = true)
	public class TheUnique implements groovy.lang.GroovyObject extends java.lang.Object { 

	    private static volatile TheUnique instance 
    	private transient groovy.lang.MetaClass metaClass 

	    private TheUnique() {
	        metaClass = /*BytecodeExpression*/
	        this.println('Instance created')
	    }

	    public java.lang.Object hello() {
	        return this.println('hello')
	    }

	    public static TheUnique getInstance() {
	        if ( instance != null) {
	            return instance 
	        } else {
	            synchronized (TheUnique) {
	                if ( instance != null) {
	                    return instance 
	                } else {
	                    return instance = new TheUnique()
	                }
	            }
	        }
	    }
	    ...
	}

It makes the constructor of the target class private as we’d expect. but since Groovy does not honor privacy, we can still create instances using the new keyword from within Groovy.

### @InheritConstructors: Route the calls back to the respective super constructors
	import groovy.transform.*
	 class Person { String first, last;
	     Person(String first, String last) { this.first = first; this.last = last.toUpperCase() }
	 }

	 @InheritConstructors
	 class PersonAge extends Person { int age  }

	 def js = new PersonAge('John', 'Smith'); js.age = 25
	 println "$js.last, $js.first is $js.age years old" // => SMITH, John is 25 years old

### Gotchas: [Differences with Java](http://docs.groovy-lang.org/latest/html/documentation/index.html#_differences_with_java)
#### Groovy’s == Is Equal to Java’s equals: Groovy maps the == operator to the equals() method in Java.
	str1 = 'hello'
	str2 = str1
	str3 = new String('hello')
	str4 = 'Hello'
	println str1 == str2 // true
	println str1 == str3 // true
	println str1 == str4 // false
	println str1.is(str2) // true
	println str1.is(str3) // false
	println str1.is(str4) // false

Comparable takes precedence:

	class A { boolean equals(other) { println "equals called"; false } }

	class B implements Comparable {
	  boolean equals(other) { println "equals called"; false }
	  int compareTo(other) {  println "compareTo called"; 0 }
	}
	new A() == new A() // equals called
	new B() == new B() // compareTo called

#### Compile-Time Type/Method -Checking Is Off by Default
Groovy is optionally typed; however, for the most part the Groovy compiler, groovyc , does not perform full type-checking. 
Instead it performs casting when it encounters type definitions.	

	lplin@dlm47 ~/t $ cat type-checking.gv 
	Integer val = 4
	val = 'hello' // Will compile with no errors.
	lplin@dlm47 ~/t $ groovyc type-checking.gv 
	lplin@dlm47 ~/t $ ls
	type-checking.class  type-checking.gv

	lplin@dlm47 ~/t $ javap -c type-checking 
	Compiled from "type-checking.gv"
	public class type-checking extends groovy.lang.Script{
	...
	public java.lang.Object run();
	  Code:
	   0:	invokestatic	#20; //Method $getCallSiteArray:()[Lorg/codehaus/groovy/runtime/callsite/CallSite;
==> `val = 4`

	   3:	astore_1
	   4:	iconst_4
==> store 4

	   5:	invokestatic	#56; //Method java/lang/Integer.valueOf:(I)Ljava/lang/Integer;
	   8:	astore_2
==> store valueOf(4)

	   9:	aload_2
	   10:	pop

==> `val = 'hello'`

	   11:	ldc	#58; //String hello
	   13:	astore_3
	   14:	aload_3
	   15:	ldc	#52; //class java/lang/Integer
	   17:	invokestatic	#62; //Method org/codehaus/groovy/runtime/ScriptBytecodeAdapter.castToType:(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
==> cast to Integer
	   
	   20:	checkcast	#52; //class java/lang/Integer

So, in Groovy, x = y is semantically equivalent to x = (ClassOfX)(y).

Similarly, if we call a method that does not exist, we will get no compilation error:

	lplin@dlm47 ~/t $ cat > MissingMethod.gv
	Integer val = 4
	val.blah()
	lplin@dlm47 ~/t $ groovyc MissingMethod.gv
	lplin@dlm47 ~/t $ javap -c MissingMethod
	Compiled from "MissingMethod.gv"
	public class MissingMethod extends groovy.lang.Script{
	...
	public java.lang.Object run();
	...
	 16:  invokeinterface #60,  2; //InterfaceMethod org/codehaus/groovy/runtime/callsite/CallSite.call:(Ljava/lang/Object;)Ljava/lang/Object;
	...
	public java.lang.Object this$dist$invoke$3(java.lang.String, java.lang.Object);
	  Code:
	   0:   invokestatic    #20; //Method $getCallSiteArray:()[Lorg/codehaus/groovy/runtime/callsite/CallSite;
	   3:   astore_3
	   4:   ldc     #2; //class MissingMethod

An advantage that between when the code is compiled and when it is executed, we can inject missing methods dynamically.

#### New Keywords (def, in, it): may lead to problems if as variable names or method names 
- `def`: defines methods, prop-erties, and local variables. 
- `in`: is used in for loops to specify the range for looping,
- `it`: refers to the closure parameter

#### No Code Block
	// Java code
	public void method() {
	    System.out.println("in method1");
	    { // 1 compilation error: Ambiguous expression could be either a parameterless closure expression or an isolated open code block;
	      System.out.println("in block");
	    }
	}
Code blocks in Java define a new scope, but Groovy gets confused. It thinks we’re defining a closure and complains.

#### Closures—Anonymous-Inner-Classes Conflict
	class Calibrator { Calibrator(calculationBlock) { print "using..."; calculationBlock() } } // Compile

	// def calibrator = new Calibrator() { println "the calculation provided" } // 1 compilation error: unexpected token:

	def calibrator = new Calibrator({ println "the calculation provided" })  // using...the calculation provided

Contrary to our expectations, Groovy assumes we’re creating an anonymous inner class and results in an error. 
We have to break away from the call convention and place the closure within the constructor-call parentheses.

#### The Semicolon Is Almost Always Optional
- Losing semicolons is good—it helps in creating DSLs. 
- Useful for placing multiple statements on the `same line`.

There’s at least one place where the semicolon is not optional:

	class Semi {
	    def val = 3;
	    { println "Instance Initializer called..." }
	}

	println new Semi() // Without the semicolon: No signature of method: java.lang.Integer.call() is applicable for argument types: (Semi$_closure1) values: [Semi$_closure1@194019b9]

#### Different Syntax for Creating Primitive Arrays from Java
// int[] arr = new int[] {1, 2, 3, 4, 5}; // 1 compilation error: unexpected token

int[] arr = [1, 2, 3, 4, 5]
println arr // [1, 2, 3, 4, 5]
println arr.getClass().name // [I ==> JVM representation for int[]

def arr1 = [1, 2, 3, 4, 5]
println arr1.getClass().name // java.util.ArrayList

def arr2 = [1, 2, 3, 4, 5] as int[]
println arr2.getClass().name // [I

Easier to create instances of ArrayList and some extra effort into creating an array.

# Dynamic Typing
## Typing in Java
	//Java code
	public Object clone() {
		try {
		    Car cloned = (Car) super.clone();
		    cloned.engine = (Engine) engine.clone();
		    return cloned;
		} catch(CloneNotSupportedException ex) {
		    return null; // Will not happen, but we need to please the compiler
		}
	}

Noisy and lowers our productivity! Not do the essential things.
- Handle CloneNotSupportedException
- Must cast, even obviously know compatible. Again, when calling: new Car().clone()

Compile-time `type-checking` has its values but reduced by IDEs' help and edit-run-test cycles.

## Advantages of dynamic typing:
- Write calls to methods on objects without nailing down the details at that moment. True polymorphism does not care about types—send a message to an object, and at runtime it figures out the appropriate implementation to use.
- Without excessive casting efforts

## Dynamic Typing != Weak Typing

What if we cast the variable to a wrong type? Will the compiler stop us? If we’re lucky, the program will crash. If not, it may wait until that important demo to crash or misbehave. Depending on how the memory is laid out, whether our call is polymorphic, and how the v-table is organized.

## Design by Capability

As Java programmers, we value “design by contract,” where interfaces define contracts for communication and classes implement and abide by these contracts.
However, interface-based programming, although very powerful, tends to be restrictive. We want the flexibility to meet and exceed the expectations in acceptable ways.

Say we need to move some heavy stuff. We ask a willing and able man to help out:

	public class TakeHelp {
	  public void takeHelp(Man man) { man.helpMoveThings(); }
	}
We ignored help from a willing and able woman. Let’s extend by creating a Human abstract class
==>
> public abstract class Human { public abstract void helpMoveThings(); }

	  public void takeHelp(Human human) { human.helpMoveThings(); }

	  public void takeHelp(Helper helper) { helper.helpMoveThings(); }

Nice elephant who also might be able to help:

	// Java code
	public interface Helper {
	  public void helpMoveThings();
	}

Extending has required some effort: creating interfaces and modifying the code to depend on them.

Groovy’s dynamic typing:  

	def takeHelp(helper) { helper.helpMoveThings() }
	class Man { void helpMoveThings() { println "Man's helping" } }
	class Woman { void helpMoveThings() { println "Woman's helping" } }
	class Elephant {void helpMoveThings() { println "Elephant's helping"}; void eatSugarcane() {println "I love sugarcanes..."} }
	takeHelp(new Man()) // Man's helping
	takeHelp(new Woman()) // Woman's helping
	takeHelp(new Elephant()) // Elephant's helping

The classes don’t extend from any common class or implement any common interface, but only with the dynamic nature of Groovy.

Dynamic Typing Needs Discipline:
- We might mistype the method name when creating one of the helpers.
- Without the type information, how do we know what to send to the method?
- What if we send the method a nonhelper (an object that’s not capable of moving stuff)?

## Optional Typing
Help integrate Groovy code with Java libraries, frameworks, and tools.

For example, to satisfy JUnit, we’ll have to define methods as `void`, instead of `def`.
The Groovy compiler `groovyc` does not do full type checking. even though Groovy allows typing, it’s still dynamically typed.

## Multimethods
	// Java code
	import java.math.BigDecimal;
	public class Employee {
	    public void raise(Number amount) {
	    	System.out.println("Employee got raise");
	    }
		static class Executive extends Employee {
			public void raise(Number amount) {
				System.out.println("Executive got raise");
			}
			public void raise(java.math.BigDecimal amount) {
				System.out.println("Executive got outlandish raise");
			}
		}
		public static void giveRaise(Employee employee) {
			employee.raise(new BigDecimal(10000.00));
		}

		public static void main(String[] args) { 
			giveRaise(new Employee()); // Employee got raise
			giveRaise(new Executive()); // In Java: Executive got raise (the compiler treats the instance of BigDecimal as Number)
										// In Groovy: Executive got outlandish raise
		}
	}	

Groovy smartly picks the correct implementation based not only on the target object—the object on which the method is invoked—but also on the parameter(s) we send to the call.
—this is called multiple dispatch or multimethods.

	//Java code
	import java.util.*;

	public class UsingCollection {
	  public static void main(String[] args) {
	    ArrayList<String> lst = new ArrayList<String>();
	    Collection<String> col = lst;
		
	    lst.add("one");
	    lst.add("two");
	    lst.add("three");
	    lst.remove(0);
	    col.remove(0); // Doesn't work
		
	    System.out.println("Added three items, removed two, so 1 item to remain.");
	    System.out.println("Number of elements is: " + lst.size()); // 2
	    System.out.println("Number of elements is: " + col.size()); // 2 in Java, 1 in Groovy
	  }
	}

The remove() method in the Collection interface expects an Object , so Java boxes the 0 into an Integer. And since an instance of Integer is not part of the list, the method call did not remove anything.	

## Dynamic: To Be or Not to Be?
Not specifying the type has the added advantages of duck typing and the ease of applying mocks for testing.
If we’re developing an API that’s intended for use by someone programming in a statically typed language, then we specify the parameter types for methods in the statically typed client-facing API.

## Switching Off Dynamic Typing: use @groovy.transform.TypeChecked and instanceof
### Static Type-Checking
We can ask the Groovy compiler to tighten its type-checking from its dynamic relaxed mode to the levels we’d expect from a statically typed compiler like javac. We can also trade in the benefits of dynamic typing and metaprogramming capabilities, and ask the Groovy compiler to statically compile code down to more-efficient bytecode.

	lplin@dlm47 ~/t $ cat > TypeChecked.gv
	@groovy.transform.TypeChecked
	def shout(String str) {
	    println "Printing in uppercase"
	    println str.toUpperCase()
	    println "Printing again in uppercase"
	    println str.toUppercase() // Typo
	}

	try {
	  shout('hello')
	} catch(ex) {
	  println ex // No signature of method: java.lang.String.toUppercase() 
	}

	lplin@dlm47 ~/t $ groovyc TypeChecked.gv
	org.codehaus.groovy.control.MultipleCompilationErrorsException: startup failed:
	TypeChecked.gv: 6: [Static type checking] - Cannot find matching method java.lang.String#toUppercase(). Please check if the declared type is right and if the method exists.
	 @ line 6, column 13.
	       println str.toUppercase() // Typo
	               ^

	1 error
Using instanceOf , then we don’t have to perform a cast on that instance to use its specialized methods or properties,

	@groovy.transform.TypeChecked
	def use(Object instance) {
	    if(instance instanceof String)
	        println instance.length() //No need to cast
	    else
	        println instance
	}
	use('hello')
	use(4)
We can freely call the Groovy-added reverse() method on String :	

	@groovy.transform.TypeChecked
	def printInReverse(String str) {
	  println str.reverse() //No problem
	}
	printInReverse 'hello' // olleh

Opt out:

	import groovy.transform.TypeChecked
	import groovy.transform.TypeCheckingMode
	@TypeChecked
	class Sample {
	  def method1() {} //static type checking in effect here
	  @TypeChecked(TypeCheckingMode.SKIP) def method2(String str) { str.shout() }
	}

	println "Done."
### Static Compilation
	@groovy.transform.CompileStatic
	def shout1(String str) {
	  println str.toUpperCase()
	}
==> Groovy compiler generates a call to invokeVirtual , like the Java compiler

	2: invokevirtual
	5: invokevirtual
	...
	#63; //Method java/lang/String.toUpperCase:()...
	#67; //Method groovy/lang/Script.println:...
If we compile the previous code using groovyc and then perform javac -p NoStatic-Compile , we’ll see that the call to the method toUpperCase() goes through the CallSite() , which takes care of Groovy’s dynamic invocation mechanism.	

# Closures
Closures are derived from the lambda expressions from functional programming, and “a lambda expression specifies the parameter and the mapping of
a function”
## The Convenience
	def pickEven(n, block) {
	    for(int i = 2; i <= n; i += 2) {
	        block(i)
	    }
	}

	pickEven(10, { println it } )

	total = 0
	pickEven(10) { total += it }
	println "Sum of even numbers from 1 to 10 is ${total}"

	product = 1
	pickEven(10) { product *= it }
	println "Product of even numbers from 1 to 10 is ${product}"

## Programming with Closures

Closures are very helpful in two specific areas. They can help manage resource cleanup and they can help create internal domain-specific languages .

## Ways to Use Closures
	def totalSelectValues(n, closure) {
	  total = 0
	  for(i in 1..n) {
	    if (closure(i)) { total += i }
	  }
	  total
	}
	print "Total of even numbers from 1 to 10 is "
	println totalSelectValues(10) { it % 2 == 0 }
	def isOdd = { it % 2 != 0}
	print "Total of odd numbers from 1 to 10 is "
	println totalSelectValues(10, isOdd)

## Passing Parameters to Closures
`it` is the default name for a single parameter passed to a closure.

Since Groovy supports optional typing, we can define the types of parameters in the closure, as in the next example:

	tellFortune() { Date date, fortune ->
	  println "Fortune for ${date} is '${fortune}'"
	}

we can use closures to override or replace methods, and in that situation the type information is quite important to ensure proper implementation.

## Resource Cleanup
	new FileWriter('output.txt').withWriter { writer ->
	  writer.write('a')
	} // no need to close()
Execute Around Method pattern:

	class Resource {
	    def open() { print "opened..." }
	    def close() { print "closed" }
	    def read() { print "read..." }
	    def write() { print "write..." }
	    //...

	    def static use(closure) {
	      def r = new Resource()
	      try {
	        r.open()
	        closure(r)
	      } finally {
	        r.close()
	      }
	    }
	}

	Resource.use { res ->
	  res.read()
	  res.write()
	}
	// opened...read...write...closed

## Closures and Coroutines
	def iterate(n, closure) {
	    1.upto(n) {
	        println "In iterate with value ${it}" // Can be a producer
	        closure(it) // Can be a consumer
	    }
	}
	println "Calling iterate"
	total = 0
	iterate(4) {
	    total += it
	    println "In closure total so far is ${total}"
	}
	println "Done"

In this code, the control transfers back and forth between the iterate() method and the closure.

Coroutines, on the other hand, support multiple entry points, each following the place of the last suspended call. We can enter a function, execute part of it, suspend, and go back to execute some code in the context or scope of the caller, handy for implementing some special logic or algorithms, such
as in a producer-consumer problem.

## Curried Closure (with prebound parameters, from Haskell B. Curry)
	def tellFortunes(closure) {
	    Date date = new Date("09/20/2012")
	    //closure date, "Your day is filled with ceremony"
	    //closure date, "They're features, not bugs"
	    // We can curry to avoid sending date repeatedly
	    postFortune = closure.curry(date)
	    postFortune "Your day is filled with ceremony"
	    postFortune "They're features, not bugs"
	}
	tellFortunes() { date, fortune ->
	    println "Fortune for ${date} is '${fortune}'" 
	    // Fortune for Thu Sep 20 00:00:00 EDT 2012 is 'Your day is filled with ceremony'
	    // Fortune for Thu Sep 20 00:00:00 EDT 2012 is 'They're features, not bugs'
	}
If one or more arguments are the same between multiple calls, we can ease this pain by prebinding some closure parameters.

We can curry any number of parameters, but we can curry only leading parameters using the curry() method. So if we have n parameters, we can curry any of the first k parameters, where 0 <= k <= n.

If we’d like to curry the trailing parameters, we can use the rcurry() method. If we need to curry values in the middle of the parameter list, we can use the ncurry() method that takes the order of the parameter we’d like to curry, along with the value.

Currying helps reduce and simplify methods for mathematical proofs. For our purpose, in Groovy, currying can reduce the noise in code.

## Dynamic Closures
	def doSomeThing(closure) {
	    if (closure) {
	        closure()
	    } else {
	        println "Using default implementation"
	    }
	}
	doSomeThing() { println "Use specialized implementation" } // Use specialized implementation
	doSomeThing() // Using default implementation

==> We can determine whether a closure has been provided to us. Otherwise, we may decide to use a default implementation for, say, an algorithm in place of a specialized implementation the caller failed to provide.

	def completeOrder(amount, taxComputer) {
	    tax = 0
	    if (taxComputer.maximumNumberOfParameters == 2) { // expects tax rate
	        tax = taxComputer(amount, 6.05) // The closure needs two params
	    } else {// uses a default rate
	        tax = taxComputer(amount)
	    }
	    println "Sales tax is ${tax}"
	}
	completeOrder(100) { it * 0.0825 }  // Sales tax is 8.2500
	completeOrder(100) { amount, rate -> amount * (rate/100) } // Sales tax is 6.0500
==> We can dynamically determine the number and types of parameters a closure expects.
The maximumNumberOfParameters property (or getMaximumNumberOfParameters() method) tells us the number of parameters the given closure accepts.

	def examine(closure) {
	    print "$closure.maximumNumberOfParameters parameter(s) given: "
	    for(aParameter in closure.parameterTypes) { print aParameter.name + ',' }
	    println "\n--"
	}
	examine() { } // 1 parameter(s) given: java.lang.Object ==>  not using any parameters, as in {} or { it } , it takes one parameter (whose name defaults to it ). 
	examine() { it } // 1 parameter(s) given: java.lang.Object
	examine() {-> } // 0 parameter(s) given: ==> take absolutely no parameters
	examine() { val1 -> } // 1 parameter(s) given: java.lang.Object
	examine() {Date val1 -> } // 1 parameter(s) given: java.util.Date
	examine() {Date val1, val2 -> } // 2 parameter(s) given: java.util.Date, java.lang.Object
	examine() {Date val1, String val2 -> } // 2 parameter(s) given: java.util.Date,java.lang.String,
==> we can find the types of these parameters using the parameterTypes property. If the caller does not pass any values to the closure, then the first parameter ( it ) refers to null .

## Closure Delegation
	def examiningClosure(closure) {
	  closure()
	}
	println "The script: " + this // ConsoleScript12@567172fc
	examiningClosure() { // 'this', 'owner' and delegate are the main script
	    println "In First Closure: " + toString() // ConsoleScript12$_run_closure1@7961df18
	    println "class is " + getClass().name // ConsoleScript12$_run_closure1
	    println "this is " + this + ", super:" + this.getClass().superclass.name // this is ConsoleScript12@567172fc, super:groovy.lang.Script ==> 'this' is the main script
	    println "owner is " + owner + ", super:" + owner.getClass().superclass.name // owner is ConsoleScript12@567172fc, super:groovy.lang.Script
	    println "delegate is " + delegate + ", super:" + delegate.getClass().superclass.name // delegate is ConsoleScript12@567172fc, super:groovy.lang.Script
	    examiningClosure() { // owner and delegate are the parent closure.
	        println "In Closure within the First Closure: " + toString() // ConsoleScript12$_run_closure1$_closure2@6427c2f5
	        println "class is " + getClass().name // class is ConsoleScript12$_run_closure1$_closure2
	        println "this is " + this + ", super:" + this.getClass().superclass.name // this is ConsoleScript12@567172fc, super:groovy.lang.Script ==> 'this' is the main script
	        println "owner is " + owner + ", super:" + owner.getClass().superclass.name // owner is onsoleScript12$_run_closure1@7961df18, super:groovy.lang.Closure
	        println "delegate is " + delegate + ", super:" + delegate.getClass().superclass.name // delegate is ConsoleScript12$_run_closure1@7961df18, super:groovy.lang.Closure
	    }
	}

==> show that closures are created as inner classes. They also show that the delegate is set to owner. Certain Groovy functions—such as with() —modify delegate to perform dynamic routing. this within a closure refers to the object to which the closure is bound (the executing context). Variables and methods referred to within the closure are bound to this —it has dibs on handling any methods calls or access to any properties or variables. The owner stands in next, followed by the delegate .	 
(Dibs: A claim expressing priority over an object. Similar to the equally definite process of calling something. ==> If you kill yourself, I have dibs on your IPod.
From: http://www.urbandictionary.com/define.php?term=dibs): 
this --> owner --> delegate

	class Handler {
	    def f1() { println "f1 of Handler called ..."}
	    def f2() { println "f2 of Handler called ..."}
	}
	class Example {
	    def f1() { println "f1 of Example called ..."}
	    def f2() { println "f2 of Example called ..."}
	    def f3() { println "f3 of Example called ..."}
	   
	    def foo(closure) {
	        closure.delegate = new Handler()
	        closure()
	    }
	}
	def f1() { println "f1 of Script called..." }
	new Example().foo {
	    f1() // f1 of Script called...
	    f2() // f2 of Handler called ...
	    f3() // MissingMethodException: No signature of method: ConsoleScript14.f3() is applicable 
	}

In this code, calls to methods within the closure are first routed to the context object— this —for the closure. If they’re not found, they’re routed to the delegate.
This has side effects, especially if the closure can be used in other functions or in other threads.

avoid the side effect—clone the closure, set the delegate on the clone, and use the clone. Groovy provides a convenient method to achieve this. Rather than performing

	def clone = closure.clone() 
		clone.delegate = handler
		clone()
we can perform those three steps in one shot using a special with() method:

	handler.with closure

## Programming with Tail Recursion
	def factorial
	factorial = { int number, BigInteger theFactorial ->
	  number == 1 ? theFactorial :
	  factorial.trampoline(number - 1, number * theFactorial)
	}.trampoline()

	println "factorial of 5 is ${factorial(5, 1)}" // factorial of 5 is 120
	println "Number of bits in the result is ${factorial(5000, 1).bitCount()}" // Number of bits in the result is 24654 (much longer, but StackOverflowError avoided)

theFactorial , which stands for the partial result being computed through the recursion. In the closure, if the given number is 1 , we return the value of theFactorial as the result. Otherwise, we invoke the closure recursively using a call to the trampoline() method. To this method we pass as the first parameter one less than the given number, narrowing down the computation range. The second parameter is the partial factorial result computed so far.

The implementation of tail recursion in Groovy is just brilliant, done without any change to the language itself. When we invoke the trampoline() method, the closure immediately returns an instance of a special class TrampolineClosure . When we pass parameters to this instance, like in factorial(5, 1) , we invoke this instance’s call() method. This method uses a simple for loop to invoke the call method on closure until it no longer yields an instance of TrampolineClosure . This simple technique turns our recursive invocation into a simple iteration under the hood. This kind of recursion is called tail recursion because the last expression in the method either terminates the recursion or calls itself back.
==> Back to the easier to use interface:

	def factorial(int factorialFor) {
	    def tailFactorial 
	    tailFactorial = { int number, BigInteger theFactorial = 1 ->
	        number == 1 ? theFactorial :
	        tailFactorial.trampoline(number - 1, number * theFactorial)
	    }.trampoline()
	    tailFactorial(factorialFor)
	}
	println "factorial of 5 is ${factorial(5)}"
	println "Number of bits in the result is ${factorial(5000).bitCount()}"

There’s one catch, however, in using the trampoline() feature—it is slower performancewise than the simple recursion or pure iteration.	

## Improving Performance Using Memoization
	def calc
	calc = { a, b ->
	  sleep(300)
	  print "$a + $b"
	  a + b
	}

	def time(closure) {
	  def start = System.currentTimeMillis()
	  closure()
	  println ': ' +  (System.currentTimeMillis() - start) + ' ms'
	}

	time { calc(1, 2) } // 1 + 2: 302 ms
	time { calc(71, 205) } // 71 + 205: 301 ms

	mem = calc.memoize()

	time { mem(1, 2) } // 1 + 2: 301 ms
	time { mem(1, 2) } // : 1 ms
	time { mem(71, 205) } // 71 + 205: 301 ms
	time { mem(71, 205) } // : 0 ms

# Working with Strings
## Literals and Expressions
	println '' + ('a' as char).getClass().name // java.lang.Character
	println "str".getClass().name // java.lang.String
	println 'str'.getClass().name // java.lang.String
	println "num: ${5}".getClass().name // org.codehaus.groovy.runtime.GStringImpl
Double/single quotes:

println 'He said, "That is Groovy"' // He said, "That is Groovy"
println "He said, 'That is Groovy'" // He said, 'That is Groovy'

We’ll have to use double quotes to evaluate the expressions in a String.

	str = 'hello'
	println str[2] // l
	str[2] = '!' // No signature of method: java.lang.String.putAt()
==> Groovy honors String's immutability

We can create an expression with either double quotes ( "" ) or slashes ( // ). However, double quotes are often used to define string expressions, and forward slashes are used for regular expressions.

We can store an expression in a string and print it later—Groovy uses lazy evaluation.
	what = new StringBuilder('fence')
	text = "The cow jumped over the $what"
	println text // The cow jumped over the fence
	what.replace(0, 5, "moon")
	println text // The cow jumped over the moon

## GString Lazy-Evaluation Problem
	res = 1 + 1
	text = "Res: $res"
	println text // Res: 2
	res = 2 + 2 // ==> Another object
	println text // Res: 2

==> For the immutable issue:

	stocks = [Apple : 663.01, Microsoft : 30.95]
	companyClosure = { it.write(company) }
	priceClosure = { it.write("$price") }

	//quote = "Today ${company} stock closed at ${price}" // Not work, ealier binding
	//quote = "Today ${companyClosure} stock closed at ${priceClosure}"
	//quote = "Today ${ -> company}} stock closed at ${{ -> price}}" // Works
	quote = "Today ${-> company} stock closed at ${-> price}" // Also works
	stocks.each { key, value ->
	  company = key
	  price = value
	//  companyClosure = { company } // Works as well
	//  priceClosure = { price }
	  println quote
	}

==> When evaluating a GString , if we have a variable, its value is simply printed to a writer, typically a StringWriter . However, if we have a closure instead of a variable, the closure is invoked. If our closure takes a parameter, then GString sends the Writer object as an argument to the closure. If our closure takes no parameters at all, then GString simply calls our closure and prints the result we return to the writer. If our closure takes more than one parameter, then the call fails with an exception;

## Multiline Strings: three single quotes
	langs = ['C++' : 'Stroustrup', 'Java' : 'Gosling', 'Lisp' : 'McCarthy']
	content = ''
	langs.each { language, author ->
	  fragment = """
	  <language name="${language}">
	    <author>${author}</author>
	  </language>
	"""
	  content += fragment
	}
	xml = "<languages>${content}</languages>"
	println xml
we can create multiline expressions using three double quotes.

## String Convenience Methods
> println "It's a rainy day in Seattle" - "rainy " // It's a day in Seattle

The Groovy-added minus() method on the String class makes this possible

	for(str in 'held'..'helm') {
	  print "${str} " // held hele helf helg helh heli helj helk hell helm 
	}
	println ""

Here we’re still using the same java.lang.String ; however, all these added facilities help us get our work done quickly.

## Regular Expressions
	println "" + (~"hello").getClass().name // java.util.regex.Pattern
	pattern = ~"(G|g)roovy"
	text = 'Groovy is Hip'
	if (text =~ pattern) println '=~ Matched' // =~ Matched
	if (!(text ==~ pattern)) println '==~ Not matched' // ==~ Not matched
The =~ performs a RegEx partial match, whereas the ==~ performs a RegEx exact match.
Groovy handles boolean evaluation of Matcher differently than Java; it returns true if there’s at least one match.

	matcher = 'Groovy is groovy' =~ /(G|g)roovy/
	println "Size of matcher is ${matcher.size()} " // 2
	println "With elements ${matcher[0]} and ${matcher[1]}." // [Groovy, G] and [groovy, g]
	println matcher.getAt(0)

If the match results in multiple matches, then the matcher contains an array of the matches.

	println '' + ('Groovy is groovy, really groovy' =~ /groovy/).replaceAll('hip') // Groovy is hip, really hip

# Collections
## List
	println '' + [1, 3].getClass().name // java.util.ArrayList
	lst = [1, 3, 4, 1, 8, 9, 2, 6]
	println lst[0] // 1
	println lst[lst.size() - 1] // 6
	println lst[-1] // 6
	println lst[-2] // 2
	println lst[2..5] // [4, 1, 8, 9]
	println lst[-6..-3] // [4, 1, 8, 9]

	subLst = lst[2..5]
	println subLst.dump() // <java.util.ArrayList@fedbf elementData=[4, 1, 8, 9] size=4 modCount=1> 
	subLst[0] = 55
	println "After subLst[0]=55 lst = $lst" // [1, 3, 4, 1, 8, 9, 2, 6]
	println "After subLst[0]=55 lst = $subLst" // [55, 1, 8, 9]

## Iterating Over an ArrayList
	lst = [1, 3, 5]
	lst.reverseEach() { print it + ', '} // 5, 3, 1,
	println ''
	lst.eachWithIndex() { it, i -> print "$i: $it, " } // 0: 1, 1: 3, 2: 5, 
	println ''
	doubled = []
	//lst.each { doubled << it * 2 }
	lst.each { doubled.leftShift(it * 2) }
	println "doubled: $doubled" // [2, 6, 10]
	println "tripled: ${lst.collect { it * 3 }}"	

## Using Finder Methods
	lst = [4, 3, 1, 2, 4, 1, 8, 9, 2, 6]
	println lst.find { it == 2 } // 2
	println lst.find { it > 4 } // 8
	println lst.find { it > 10 } // null
	println lst.findIndexOf { it > 4 } // 6
	println lst.findAll { it > 4 } // [8, 9, 6]

## Other Convenience Methods on Lists
	lst = ['Programming', 'In', 'Groovy']
	count = 0
	lst.each { count += it.size() }
	println count // 19 --> the total number of characters.
	println lst.collect { it.size() }.sum() // 19
	println lst*.size().sum() // 19

	// If we want a cumulative result of applying a computation on each element of a collection: prefer the inject() method over the collect()
	println lst.inject(0) { carryOver, element -> carryOver + element.size() } // 19, takes as a parameter an initial value that it will inject, 

	println lst.join(' ') // Programming In Groovy

	lst[0] = ['Be', 'Productive'] // Replace an element of a List
	println lst // [[Be, Productive], In, Groovy]

	lst = lst.flatten()
	println lst // [Be, Productive, In, Groovy]
	println lst - ['Productive', 'In'] // [Be, Groovy]

	println lst.size() // 4
	println lst*.size() // [2, 10, 2, 6] ==> the * operator (the spread operator), the same as lst.collect { it.size() }

	def words(a, b, c, d) { println "$a $b $c $d" } // Be Productive In Groovy
	words(*lst) // the * operator (the spread operator)

## Map Class
	langs = ['C++' : 'Stroustrup', 'Java' : 'Gosling', 'Lisp' : 'McCarthy']
	langs = ['C++' : 'Stroustrup', Java : 'Gosling', Lisp : 'McCarthy'] // Also works
	println langs.class // null, we’re not able to call the class property on the Map ==>
	println langs.getClass().name // java.util.LinkedHashMap. To avoid surprises, always use the getClass()
	println langs['Java'] // Gosling
	println langs.Java // Gosling
	// println langs.C++ // NullPointerException: Cannot invoke method next() on null object
	println langs.'C++' // Stroustrup

## Iterating Over Map
	langs = ['C++' : 'Stroustrup', Java : 'Gosling', Lisp : 'McCarthy']
	langs.each { entry -> // an instance of MapEntry
	  println "Language $entry.key was authored by $entry.value"
	}

	langs.each { language, author -> // Or key-value pair version. 
	  println "Language $language was authored by $author"
	}

	// Other methods—such as collect() , find() , also work for two versions.
	println langs.collect { language, author ->
	  language.replaceAll("[+]", "P") // [CPP, Java, Lisp]
	}

	println "Looking for the first language with name greater than 3 characters"
	entry = langs.find { language, author -> // a MapEntry will be returned, if the closure returns true. Otherwise, null.
	  language.size() > 3
	}
	println "Found $entry.key written by $entry.value"

	println "Looking for all languages with name greater than 3 characters"
	selected = langs.findAll { language, author ->
	  language.size() > 3
	}
	selected.each { key, value ->
	  println "Found $key written by $value"
	}

## Other Convenience Methods on Maps
	friends = [ briang : 'Brian Goetz', brians : 'Brian Sletten',
	    davidb : 'David Bock', davidg : 'David Geary',
	    scottd : 'Scott Davis', scottl : 'Scott Leberknight',
	    stuarth : 'Stuart Halloway']
	groupByFirstName = friends.groupBy { it.value.split(' ')[0] }
	groupByFirstName.each { firstName, buddies ->
	    println "$firstName : ${buddies.collect { key, fullName -> fullName }.join(', ')}"
	    //Brian : Brian Goetz, Brian Sletten
	    //David : David Bock, David Geary
	    //Scott : Scott Davis, Scott Leberknight
	    //Stuart : Stuart Halloway  
	}

two final conveniences to remember: Groovy’s use of Map for `named parameters` and the use of Map s to `implement interfaces`.

# GDK: Groovy Java Development Kit (io, lang, util, net, math, sql)
## Object Extensions
### dump and inspect Methods
	println 'str1'.dump() // <java.lang.String@360820 value=str1 hash=3541024 hash32=0>, for debugging, logging, and learning.
	println 'str2'.inspect() // 'str2', If unimplemented, returns what toString() returns.
	// Tell what input would be needed to create an object, helping our class’s users figure out at runtime what input they should provide. 
### the Context with() Method
	lst = [1, 2]
	lst.with {
	    add(3)
	    println size()  // 3
	    println contains(2) // true
	    println "this is ${this}," // ConsoleScript28@2fc72d21,
	    println "owner is ${owner}," // ConsoleScript28@2fc72d21
	    println "delegate is ${delegate}." // delegate is [1, 2, 3]: the object on which with() is called
	}
Delegate has dibs on methods that this doesn’t pick up.
### soundSleep: ignores interrupts
	thread = Thread.start { // a convenient way to execute a piece of code in a different thread
	    println "Thread started"
	    startTime = System.nanoTime()
	//    new Object().sleep(2000) 
	    new Object().sleep(2000) { // Thread done in 2.003031603 seconds
	        println "Interrupted... " + it // java.lang.InterruptedException: sleep interrupted
	        true // 0.100643925 seconds
	//        false // 2.002462103 seconds // continue as if uninterrupted
	    }    
	    println "Thread done in ${(System.nanoTime() - startTime)/10**9} seconds"
	    
	}
	new Object().sleep(100)
	println "Let's interrupt that thread"
	thread.interrupt() // the thread ignored the interrupts
	thread.join()
### Accessing Properties Indirectly
	class Car {
	  int miles, fuelLevel
	}
	car = new Car(fuelLevel: 80, miles: 25)
	properties = ['miles', 'fuelLevel']
	properties.each { name ->
	  println "$name = ${car[name]}" // [] operator—the Groovy-added getAt()
	}
	car[properties[1]] = 100 // putAt() method.
	println "fuelLevel now is ${car.fuelLevel}" // fuelLevel now is 100
### Invoking Methods Indirectly
	class Person {
	    def walk() { println "Walking..." }
	    def walk(int miles) { println "Walking $miles miles..." }
	    def walk(int miles, String where) { println "Walking $miles miles $where..." }
	}
	peter = new Person()
	//peter.invokeMethod("walk")  // No signature of invokeMethod() applicable for argument types: (java.lang.String)
	peter.invokeMethod("walk", null)  // If using reflection, 1. fetch the Class meta. 2. getMethod() 3.invoke() on it. And, exception handling.
	peter.invokeMethod("walk", 10)
	//peter.invokeMethod("walk", 2, 'uphill') // No signature of invokeMethod() for argument types: (java.lang.String, java.lang.Integer, java.lang.String)
	peter.invokeMethod("walk", [2, 'uphill'] as Object[])
Groovy also provides getMetaClass() to get the metaclass object, which is a key object for taking advantage of dynamic capabilities in Groovy.
## Other Extensions
### Array Extensions
	println '' + [1, 2, 3, 4, 5, 6][2..4] // [3, 4, 5], 'Range' object as an index on all the array types
### java.lang Extensions
	process = "wc".execute()
	process.out.withWriter { // Send input to process, Unix-like pipe
	    it << "Let the World know...\n"
	    it << "Groovy Rocks!\n"
	} // flushes and closes the stream automatically

	println process.in.text // Read output from process: 2 6 36 (as newline,  word, and byte counts)
	// or
	//println process.text

	//println "ls -lart".execute().text // Or
	println '' + ['ls', '-lart'].execute().text
	String[] command = ['groovy', '-e', '"print \'Groovy\'"']
	println "Calling: ${command.join(' ')}"
	println command.execute().text // Groovy
The Process class has convenience methods to access the stdin , stdout , and stderr commands—the `out , in , and err` properties, respectively. It also has the `text` property that can give us the entire standard output or response from the process. If we want to read the entire standard error in one shot, we can use `err.text` on the process instance. We can use the `<<` operator to `pipe into a process`.

	def printThreadInfo(msg) {
	    def currentThread = Thread.currentThread()
	    println "\n$msg Thread is ${currentThread}. Daemon? ${currentThread.isDaemon()}"
	}
	printThreadInfo 'Main' // Main Thread is Thread[Thread-30,6,main]. Daemon? false
	Thread.start { // we don’t need to work with instances of Thread or Runnable
	    printThreadInfo "Started" // Started Thread is Thread[Thread-31,6,main]. Daemon? false
	    sleep(3000) { println "Interrupted" }
	    println "Finished Started" // Finished Started
	}
	sleep(1000)
	Thread.startDaemon {
	    printThreadInfo "Started Daemon" // Started Daemon Thread is Thread[Thread-32,6,main]. Daemon? true
	    sleep(5000) { println "Interrupted" }
	    println "Finished Started Daemon" // Will not get here if run as a script
	    // A daemon thread quits if there are no active nondaemon threads currently running—kind of like employees who work only when the boss is around.
	}
	// Result: Thread[Thread-32,6,main]
Noticeable additions to the primitive type wrappers like Character ,Integer , and so on is the overloaded operator-mapping methods, such as `plus() for operator +` , `next() for operator ++`: useful when creating DSLs. Number (which Integer and Double extend) has picked up the iterator methods `upto() and downto()` . It also has the `step()`, helping iterate over a range of values.
### java.io Extensions
	home = System.getProperty('user.home')
	env = System.properties
	println new File("${home}/.bashrc").text
	new File("$home/.gitconfig").eachLine { line -> // if we want to read and process one line at a time
	    println line // or do whatever you like with that line here
	}
	println new File("$home/.bashrc").filterLine { it =~ /JAVA/ } // only those lines of text that meet a certain condition,

	new File("$home/tmp/output.txt").withWriter{ file ->
	  file << "some data..."
	}

To automatically flush and close an input stream when we’re done using it, we can use the `withStream() / withWriter()` method.
InputStream ’s withReader() method creates a BufferedReader that’s attached to the input stream and sends it to the closure that it accepts as a parameter. We can also obtain a new instance of BufferedReader by calling the newReader() method.

We can iterate over the stream of input in InputStream and DataInputStream using an Iterator we obtain by calling the iterator() method. Speaking of iterating, we
can conveniently iterate over objects in an ObjectInputStream , as well. If we want to use a Reader instead, we can. The convenience methods added to InputStream  are still available on it. We can easily write contents to a file or stream in Groovy. The OutputStream , ObjectOutputStream , and Writer classes have received a  ace-lift via the leftShift() method (the << operator).

### java.util Extensions
List , Set , SortedMap , and SortedSet have gained the method asImmutable() to obtain an immutable instance of their respective instances. They also have a method asSynchronized() to create an instance that is thread-safe.

The Iterator supports the inject() method.
> println lst.inject(0) { carryOver, element -> carryOver + element.size() } 

A runAfter() method has been added to the java.util.Timer class.

Groovy enhances the API for several classes and interfaces— Matcher , Writer , Reader , List , Map , Socket ...the list goes on. The GDK has extensions for several JDK classes and interfaces. The GDK is far too large for us to cover entirely in this book; visit http://www.groovy-lang.org/gdk.html.

## Custom Methods Using the Extension Modules
	$ cat com/lplin/PriceExtension.groovy 
	package com.lplin
	class PriceExtension {
	    public static double getPrice(String self) {
	        def url = "http://ichart.finance.yahoo.com/table.csv?s=$self".toURL()
	        def data = url.readLines()[1].split(",")
	        Double.parseDouble(data[-1])
	    }
	}
	$ cat com/lplin/PriceStaticExtension.groovy 
	package com.lplin;
	class PriceStaticExtension {
	    public static double getPrice(String selfType, String ticker) {
	        def url = "http://ichart.finance.yahoo.com/table.csv?s=$ticker".toURL()
	        def data = url.readLines()[1].split(",")
	        Double.parseDouble(data[-1])
	    }
	}$ cat manifest/META-INF/services/org.codehaus.groovy.runtime.ExtensionModule 
	moduleName=price-module
	moduleVersion=1.0-test
	extensionClasses=com.lplin.PriceExtension
	staticExtensionClasses=com.lplin.PriceStaticExtension
	$ cat FindPrice.groovy 
	def ticker = "ORCL"
	println "Price for $ticker using instance method is ${String.getPrice(ticker)}"
	println "Price for $ticker using static method is ${ticker.getPrice()}"
	$ jar -cf priceExtensions.jar -C classes com -C manifest .
	$ jar -tf priceExtensions.jar 
	META-INF/
	META-INF/MANIFEST.MF
	com/
	com/lplin/
	com/lplin/PriceExtension.class
	com/lplin/PriceStaticExtension.class
	META-INF/services/
	META-INF/services/org.codehaus.groovy.runtime.ExtensionModule

	$ groovy -classpath priceExtensions.jar FindPrice.groovy 
	Price for ORCL using instance method is 38.860001
	Price for ORCL using static method is 38.860001

	$ groovyConsole -cp priceExtensions.jar FindPrice.groovy

we can add our own instance or static methods to existing classes at compile time and use them throughout the application at runtime.
- First, a method we want to add must be defined in an extension-module class. 
- Second, we need a descriptor file in the manifest file to tell the Groovy compiler what extension-module classes to look for.

as if they were provided in the JDK or the GDK. 
- Both types of extension methods have to be defined as static , and 
- the first parameter should be of the type on which the method is expected to be added. The definition provides as additional parameters any arguments the extension method is expected to take.

# XML
## Parsing
### DOMCategory
	$ cat > languages.xml
	<languages>
	    <language name="C++">
	        <author>Stroustrup</author>
	    </language>
	    <language name="Java">
	        <author>Gosling</author>
	    </language>
	    <language name="Lisp">
	        <author>McCarthy</author>
	    </language>
	    <language name="Modula-2">
	        <author>Wirth</author>
	    </language>
	    <language name="Oberon-2">
	        <author>Wirth</author>
	    </language>
	    <language name="Pascal">
	        <author>Wirth</author>
	    </language>
	</languages>
Then

	document = groovy.xml.DOMBuilder.parse(new FileReader('languages.xml'))
	rootElement = document.documentElement
	use(groovy.xml.dom.DOMCategory) {
	    println "Languages and authors:"
	    languages = rootElement.language
	    languages.each { language ->
	        println "    ${language.'@name'} authored by ${language.author[0].text()}"
	    }
	    def languagesByAuthor = { authorName ->
	        languages.findAll {it.author[0].text() == authorName }.collect {it.'@name' }.join(', ')
	    }
	    println "Languages by Wirth: " + languagesByAuthor('Wirth')
	}

We can access all child elements simply using the child name. For example, instead of calling getElementsByTagName('name') , use the property name to get it, as in rootElement.language . That is, given the root element, languages , a simple call rootElement.language will get all the language elements. The DOM parser gives the rootElement ; in the following example, we’ll use the DOMBuilder ’s parse() method to get the document loaded in memory. We can obtain the value for an attribute by  lacing an @ before the attribute name, as in language.@name .
### XMLParser
	languages = new XmlParser().parse('languages.xml')
	println "Languages and authors:"
	languages.each {
	    println "\t${it.@name} authored by ${it.author[0].text()}"
	}
	def languagesByAuthor = { authorName ->
	    languages.findAll { it.author[0].text() == authorName }.collect {it.@name }.join(', ')
	}
	println "Languages by Wirth:" + languagesByAuthor('Wirth')

groovy.util.XMLParser exploits Groovy’s dynamic typing and metaprogramming capabilities. We can access the members of our document directly by name. For example, we can access an author’s name using it.author[0] .
XMLParser has added the convenience of iterators to the elements, so we can navigate easily using methods such as each() , collect() , and find() . Using XMLParser  as a couple of downsides: it does not preserve the XML InfoSet, and it ignores the XML comments and processing instructions in documents. The convenience it  provides makes it a great tool for most common processing needs.
### XMLSlurper
	languages = new XmlSlurper().parse('languages.xml')
	println "Languages and authors:"
	languages.language.each {
	    println "\t${it.@name} authored by ${it.author[0].text()}"
	}
	def languagesByAuthor = { authorName ->
	    languages.language.findAll { it.author[0].text() == authorName }.collect {it.@name }.join(', ')
	}
	println "Languages by Wirth:" + languagesByAuthor('Wirth')

For large document sizes, the memory usage of XMLParser might become prohibitive. The class XMLSlurper comes to rescue in these cases. It performs a lazy evaluation, so it’s kind on memory usage and has low overhead.

We can parse XML documents with namespaces in them, as well. `namespaces` can help deal with name collisions.
namespaces are not URLs, but they are required to be unique. The prefixes we use for namespaces in our XML document are not unique. We can make them up as we please (well, with some naming restrictions).

GPath queries can contain prefixes for names, as well. element.name will return all child elements with name , independent of the namespace; however, element.'ns:name' will return only elements with the namespace that ns is asso ciated with.

	$ cat > computerAndNaturalLanguages.xml
	<languages
	    xmlns:computer="Computer"
	    xmlns:natural="Natural">
	    <computer:language name="Java"/>
	    <computer:language name="Groovy"/>
	    <computer:language name="Erlang"/>
	    <natural:language name="English"/>
	    <natural:language name="German"/>
	    <natural:language name="French"/>
	</languages>
Then

	languages = new XmlSlurper().parse('computerAndNaturalLanguages.xml').declareNamespace(human: 'Natural')
	print "Languages: "
	println languages.language.collect { it.@name }.join(', ') // Languages: Java, Groovy, Erlang, English, German, French
	print "Natural languages: "
	println languages.'human:language'.collect { it.@name }.join(', ') // Natural languages: English, German, French
	// ==> Once we define the prefixes, our GPath queries can contain prefixes for names
## Creating
### GString
	langs = ['C++' : 'Stroustrup', 'Java' : 'Gosling', 'Lisp' : 'McCarthy']
	content = ''
	langs.each { language, author ->
	fragment = """
	    <language name="${language}">
	        <author>${author}</author>
	    </language>
	"""
	content += fragment
	}
	xml = "<languages>${content}</languages>"
	println xml

### MarkupBuilder or StreamingMarkupBuilder
	import groovy.xml.*

	langs = ['C++' : 'Stroustrup', 'Java' : 'Gosling', 'Lisp' : 'McCarthy']
	xmlDocument = new groovy.xml.StreamingMarkupBuilder().bind {
	    mkp.xmlDeclaration()
	    mkp.declareNamespace(computer: "Computer")
	    languages {
	        comment << "Created using StreamingMarkupBuilder"
	        langs.each { key, value ->
	                computer.language(name: key) {
	                author (value)
	            }
	        }
	    }
	}

	println XmlUtil.serialize(xmlDocument)	
==>

	<?xml version="1.0" encoding="UTF-8"?><languages xmlns:computer="Computer">
	  <!--Created using StreamingMarkupBuilder-->
	  <computer:language name="C++">
	    <author>Stroustrup</author>
	  </computer:language>
	  <computer:language name="Java">
	    <author>Gosling</author>
	  </computer:language>
	  <computer:language name="Lisp">
	    <author>McCarthy</author>
	  </computer:language>
	</languages>

This is the preferred approach in Groovy applications because the convenience the builders provide makes it easy to create XML documents. We don’t have to mess with complex APIs or string manipulation;

# Databases
GSQL is a wrapper around Java Database Connectivity (JDBC) that
provides a number of convenience methods to easily access data. We can
quickly create SQL queries and then use built-in iterators to traverse the
results, all using Groovy syntax.

## Setting Up
	$ cat > createdb.sql
	-- create database if not exists weatherinfo;
	-- use weatherinfo;
	drop table if exists weather;
	create table weather (
	  city varchar(100) not null,
	  temperature integer not null
	);

	insert into weather (city, temperature) values ('Austin', 48);
	insert into weather (city, temperature) values ('Baton Rouge', 57);
	insert into weather (city, temperature) values ('Jackson', 50);
	insert into weather (city, temperature) values ('Montgomery', 53);
	insert into weather (city, temperature) values ('Phoenix', 67);
	insert into weather (city, temperature) values ('Sacramento', 66);
	insert into weather (city, temperature) values ('Santa Fe', 27);
	insert into weather (city, temperature) values ('Tallahassee', 59);

## Connecting
	@GrabConfig(systemClassLoader=true)
	@Grab(group='com.h2database', module='h2', version='1.3.168')

	import groovy.sql.Sql

	def sql = Sql.newInstance("jdbc:h2:mem:weatherinfo;MODE=MYSQL;DATABASE_TO_UPPER=false", "sa", "", "org.h2.Driver")
	println sql.connection.catalog // weatherinfo
	sql.execute(new File('createdb.sql').text)
	println sql.rows('select * from weather')

## Select
	printf "%-20sTemperature\n", 'City'
	sql.eachRow('SELECT * from weather') {
	  printf "%-20s%s\n", it.city, it[1]
	}

	processMeta = { metaData -> // The closure for metadata is called only once
	    metaData.columnCount.times { i ->
	        printf "%-21s", metaData.getColumnLabel(i+1)
	    }
	    println ""
	}
	sql.eachRow('SELECT * from weather', processMeta) {
	  printf "%-20s %s\n", it.city, it[1]
	}

rows = sql.rows('SELECT * from weather') // an ArrayList instance of result data
println "Weather info available for ${rows.size()} cities"
println "First: " + sql.firstRow('SELECT * from weather')


We can perform stored-procedure calls using the call() methods of Sql . Use the withStatement() method to set up a closure that will be called before the execution of queries. This will help if we want to intercept and alter the SQL queries before execution.

## Transforming Data to XML
	@GrabConfig(systemClassLoader=true)
	@Grab(group='com.h2database', module='h2', version='1.3.168')

	import groovy.sql.Sql

	def sql = Sql.newInstance("jdbc:h2:mem:weatherinfo;MODE=MYSQL;DATABASE_TO_UPPER=false", "sa", "", "org.h2.Driver")
	sql.execute(new File('createdb.sql').text)

	bldr = new groovy.xml.MarkupBuilder()
	bldr.weather {
	    sql.eachRow('SELECT * from weather') {
	        city(name: it.city, temperature: it.temperature)  // DSL
	    }
	}
==>

	<weather>
	  <city name='Austin' temperature='48' />
	  ...
	</weather> 

## DataSet
	@GrabConfig(systemClassLoader=true)
	@Grab(group='com.h2database', module='h2', version='1.4.189')

	import groovy.sql.Sql

	def sql = Sql.newInstance("jdbc:h2:mem:weatherinfo;MODE=MYSQL;DATABASE_TO_UPPER=false", "sa", "", "org.h2.Driver")
	sql.execute(new File('/home/lplin/tmp/createdb.sql').text)

	dataSet = sql.dataSet('weather')
	citiesBelowFreezing = dataSet.findAll { temperature < 32 }
	println "Cities below freezing:"
	citiesBelowFreezing.each {
	  println '' + it.city // Santa Fe
	}

==> groovy.lang.GroovyRuntimeException: DataSet unable to evaluate expression. AST not available for closure: ConsoleScript0$_run_closure1. Is the source code on the classpath?
		at ConsoleScript0.run(ConsoleScript0:14)

	$ groovy -cp /home/lplin/.m2/repository/com/h2database/h2/1.4.189/h2-1.4.189.jar ./dbTest.groovy 
	Cities below freezing:
	Santa Fe

	$ groovyConsole -cp /home/lplin/.m2/repository/com/h2database/h2/1.4.189/h2-1.4.189.jar

	$ groovyConsole dbTest.groovy # Also works!

	$ groovyConsole & # Not work for both 1.3.168 and 1.4.189.


The dataSet() method of the Sql class takes a table’s name and returns a virtual proxy. The actual data is still not fetched until we call the each() method on the resulting object. As a result, DataSet is highly efficient, extracting only data that is selected.

## Inserting and Updating
	@GrabConfig(systemClassLoader=true)
	@Grab(group='com.h2database', module='h2', version='1.4.189')

	import groovy.sql.Sql

	def sql = Sql.newInstance("jdbc:h2:mem:weatherinfo;MODE=MYSQL;DATABASE_TO_UPPER=false", "sa", "", "org.h2.Driver")
	sql.execute(new File('createdb.sql').text)

	dataSet = sql.dataSet('weather')
	println "Number of cities : " + sql.rows('SELECT * from weather').size() // 8
	// println dataSet.metaClass.methods*.name.unique().sort()
	// println dataSet.rows().size() // dataSet.size() doesn't work probably laziness. This this the closest.
	dataSet.add(city: 'Denver', temperature: 19)
	println "Number of cities : " + sql.rows('SELECT * from weather').size() // 9
	println dataSet.findAll{ it.city == 'Denver' }.each { println it } // [city:Denver, temperature:19]

We can perform updates and deletions in a similar way by issuing the appropriate SQL commands.
(Well executeUpdate and executeInsert are inherited from groovy.sql.Sql: http://docs.groovy-lang.org/latest/html/api/groovy/sql/DataSet.html)

## Accessing Microsoft Excel
	def sql = groovy.sql.Sql.newInstance(
	"""jdbc:odbc:Driver=
	{Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)};
	DBQ=/home/lplin/tmp/weather.xlsx;READONLY=false""", '', '', 'sun.jdbc.odbc.JdbcOdbcDriver')
	println "City\t\tTemperature"
	sql.eachRow('SELECT * FROM [temperatures$]') {
	  println "${it.city}\t\t${it.temperature}"
	}
==> $ /home/lplin/apps/jdk1.7.0_71/bin/java: symbol lookup error: /home/lplin/apps/jdk1.7.0_71/jre/lib/amd64/libJdbcOdbc.so: undefined symbol: SQLAllocEnv

	@Grab(group='org.apache.poi', module='poi', version='3.13')
	import static org.apache.poi.ss.usermodel.CellStyle.*
	import static org.apache.poi.ss.usermodel.IndexedColors.*
	import org.apache.poi.hssf.usermodel.HSSFWorkbook

	new HSSFWorkbook().with { workbook ->
	  def styles = [ LIGHT_BLUE, LIGHT_GREEN, LIGHT_ORANGE ].collect { color ->
	    createCellStyle().with { style ->
	      fillForegroundColor = color.index
	      fillPattern = SOLID_FOREGROUND
	      style
	    }
	  }
	  createSheet( 'Output' ).with { sheet ->
	    (0..4).each { rownum ->
	      createRow( rownum ).with { row ->
	        (0..4).each { colnum ->
	          createCell( colnum ).with { cell ->
	            setCellValue( "[$colnum,$rownum]" )
	            cellStyle = styles[ ( ( rownum * 5 ) + colnum ) % styles.size() ]
	          }
	        }
	      }
	    }
	    new File( '/tmp/test.xls' ).withOutputStream { os ->
	      write( os )
	    }
	  }
	}
==> Works! Reader:

	@Grab(group='org.apache.poi', module='poi', version='3.13')
	import org.apache.poi.hssf.usermodel.*
	import org.apache.poi.poifs.filesystem.POIFSFileSystem;

	def displayFromExcel(String xlsPath) {
	    POIFSFileSystem fileSystem = new POIFSFileSystem(new FileInputStream(xlsPath));
	    HSSFWorkbook workBook = new HSSFWorkbook(fileSystem);
	    HSSFSheet sheet = workBook.getSheetAt(0);
	    Iterator rows = sheet.rowIterator();

	    while (rows.hasNext()) {
	        HSSFRow row = rows.next();
	        System.out.println("Row No.: " + row.getRowNum());
	        Iterator cells = row.cellIterator();
	        while (cells.hasNext()) {
	            HSSFCell cell = cells.next();
	            System.out.println("Cell No.: " + cell.getCellNum());
	            switch (cell.getCellType()) {
	                case HSSFCell.CELL_TYPE_NUMERIC:
	                    System.out.println("Numeric value: " + cell.getNumericCellValue());
	                    break;
	                case HSSFCell.CELL_TYPE_STRING:
	                    // cell type string.
	                    HSSFRichTextString richTextString = cell.getRichStringCellValue();
	                    System.out.println("String value: " + richTextString.getString());
	                    break;

	                default:
	                    // types other than String and Numeric.
	                    System.out.println("Type not supported.");

	                    break;
	            }
	        }
	    }
	}

	displayFromExcel ('weather.xls');

# Working with Scripts and Classes
## The Melting Pot of Java and Groovy
To pull a Groovy script into our Groovy code, we can use GroovyShell . To use it from within our Java classes, we can use the ScriptEngine API provided by JSR 223. If we want to use a Groovy class from within a Java class, or vice versa, we can take advantage of the Groovy joint-compilation facility.

## Running Groovy using Java
to create bytecode—the .class file—we can do that using the groovyc compiler. To execute the bytecode, we’ll use the java command just like we would to execute our compiled Java code. The only difference is that we need to have the groovy-all-2.1.0.jar file in the classpath.

If our code has a package declaration, then the file will be created in the appropriate directory following the Java package-directory format. Unlike Groovy classes, Groovy scripts usually don’t have package declarations. Use the -d option to specify a destination directory other than the current directory. We can run the bytecode by typing this:

	$ cat > Greet.groovy
	println (['Groovy', 'Rocks!'].join(' '))
	 $ java -classpath /home/lplin/.sdkman/groovy/current/embeddable/groovy-all-2.4.5.jar:. Greet
	Groovy Rocks!

## Using Groovy Classes from Groovy
Groovy looks for the .groovy file with the name of the class in our classpath ; if it does not find it, it looks for a .class file with the same name.
