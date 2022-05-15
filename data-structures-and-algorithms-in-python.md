# Data Structures and Algorithms in Python

## Part I - Python Primer
### Chapter 1.1 - Python Overview
This book is based on Python 3.
Use `python -i script.py` for running `script.py` and entering interactive mode.
Individual statements are concluded with a newline character, although a command can extend to another line, either with a concluding backslash charracter (`\`), or if an opening delimiter has not yet been closed.

### Chapter 1.2 - Objects in Python
Classes form the basis for all data types. 
The semantics of a Python identifier is most similar to a reference variable in Java or a pointer variable in C++.
Each identifier is implicitly associated with the memory address of the object to which it refers.

The process of creating a new instance of a class is known as instantiation.
Most of Python's built-in classes support what is known as a literal form for designating new instances.
For example, the command `temp = 98.6` results in the creation of a new instance of the float class.
Another way to indirectly create a new instance of a class is to call a function that creates and returns such an instance.
Python's built-in function `sorted` takes a sequence of comparable elements and returns a new instance of the list class. 

When using a method of a class, it is important to understand its behavior.
Methods that return information about the state of an object, but do not change the state, are known as accessors.
Methods that change the state of an object are known as mutators or update methods.

Some common built-in classes are:
* `bool`: Boolean value. Immutable.
* `int`: Integer value (arbitrary magnitude). Immutable.
* `float`: Floating-point number. Immutable.
* `list`: Mutable sequence of objects. Mutable.
* `tuple`: Immutable sequence of objects. Immutable.
* `str`: Character string. Immutable.
* `set`: Unordered set of distinct objects. Mutable.
* `frozenset`: immutable form of `set` class. Immutable.
* `dict`: Associative mapping (aka dictionary). Mutable.

A `list` instance stores a sequence of objects.
A `list` is a referential structure, as it technically stores a sequence of references to its elements.

The `tuple` class provides an immutable version of a sequence, and therefore its instances have an internal representation that may be more streamlined than that of the `list`.

Python's `set` class represents the mathematical notion of a set, namely a collection of elements, without duplicates, and without an inherent order to those elements.
The major advantage of using a `set`, as oppossed to a `list`,  is that it has a highly optimized method for checking whether a specific element is contained in the set.
This is based on a data structure known as a hash table.
Only instances of immutable types can be added to a Python `set`.
Python uses curly braces as delimiters for a `set`.

Python's `dict` class represents a dictionary, or mapping, from a set of distinct keys to associated values.
Python implements a `dict` using an almost identical approach to that of a `set`, but with storage of the associated values.

### Chapter 1.3 - Expressions, Operators, and Precedence
Python provides the following bitwise operators for integers:
* `~`: Bitwise complement (prefix unary operator).
* `&`: Bitwise and.
* `|`: Bitwise or.
* `^`: Bitwise exclusive-or.
* `<<`: Shift bits to left, filling with zeros.
* `>>`: Shift bits to right, filling in with sign bit.

### Chapter 1.4 - Control Flow
Pass.

### Chapter 1.5 - Functions
A function describes a traditional, stateless function that is invoked without the context of a particular class or an instance of that class.
Each time a function is called, Python creates a dedicated activation record that stores information relevant to the current call.
This activation record includes what is known as a namespace to manage all identifiers that have local scope within the current call.
In the context of a function signature, the identifiers used to describe the expected parameters are known as formal parameters, and the objects sent by the caller when invoking the function are the actual parameters.
An advantage to Python's mechanism for passing information to and from a function is that objects are not copied.
This ensures that the invocation of a function is efficient, even in a case where a parameter or return value is a complex object.

Python's parameter passing model has additional implications when a parameter is a mutable object.
Because the formal parameter is an alias for the actual parameter, the body of the function may interact with the object in ways that change its state.

### Chapter 1.6 - Simple Input and Output
Address the basics of input and output in Python.
The built-in function, `print`, is used to generate standard output to console.
The primary means for acquiring information from the user console is a built-in function named `input`.
The formal return value of the function is the string of characters that were entered strictly before the return key (i.e. no newline character exists in the returned string).

Files are typically accessed in Python beginning with a call to a built-in function, named `open`, that returns a proxy for interactions with the underlying file.
The `open` function takes an optional second parameter that determines the access mode.
The default mode is `r` for reading.
Other common mores are `w` for writing to the file (causing any existing file with that name to be overwritten), or `a` for appending to the end of an existing file.
It is also possible to work with binary files, using access modes such as `rb` or `wb`.
The syntax `fp.close()` closes a file associated with the proxy `fp` ensuring that any written contents are saved.

### Chapter 1.7 - Exception Handling
In Python, exceptions (also known as errors) are objects that are raised (or thrown) by code that encounters an unexpected circumstance.
A raised error may be caught by a surrounding context that "handles" the exception in an appropriate fashion.
The `Exception` class serves as a base class for most other error types.

An exception is thrown by executing the raise statement, with an appropriate instance of an exception class as an argument that designates the problem
For example in a squareroot function:
```python
def sqrt(x):
    if not isinstance(x, (int, float)):
        raise TypeError('x must be numeric')
    elif x < 0:
        raise ValueError('x cannot be negative')
    # Do the real work here...
```

How much error-checking to perform within a function is a matter of debate.
Checking the type and value of each parameter demands additional execution time and, if taken to an extreme, seems counter to the nature of Python. 

A philosophy often embraced by Python programmers, is that "it is easier to ask for forgiveness than it is to get permission".
In Python, this philosophy is implemented using a try-except control structure:
```python
try:
    ratio = x / y
except ZeroDivisionError:
    ... do something else.
```

In this structure, the `try` block is the primary code to be executed.
Following the `try` block are one or more `except` cases, each with an identified error type and an indented block of code that should be executed if the designated error is raised within the `try` block.

The relative advantage of using a try-except structure is that the non-exceptional case runs effectively, wihtout extraneous checks for the exceptional condition.

### Chapter 1.8 - Iterators and Generators
An iterator is an object that manages an iteration through a series of values.
If variable, `i`, identifies an iterator object, then each call to the built-in function, `next(i)`, produces a subsequent element from the underlying series, with a `StopIteration` exception raised to indicate that there are no further elements.

An iterable is an object, `obj`, that produces and iterator via the syntax `iter(obj)`.

The most convenient technique for creating iterators in Python is through the use of generators.
A generator is implemented with a syntax that is very similar to a function, but instead of returning values, a `yield` statement is executed to indicate each element of the series.
Example of finding factors of a number:
```python
def factors(n):
    for k in range(1, n + 1):
        if n % k == 0:
            yield k
```

### Chapter 1.10 - Scopes and Namespaces
The process of determining the value associated with an identifier is known as name resolution.
Whenever an identifier is assigned to a value, that definition is made with a specific scope.
Top-level assignments are typically made in what is known as global scope.
Assignments made in the body of a function typically have a scope that is local to that function call.
Each distinct scope in Python is represented using an abstraction known as a namespace.
A namespace manages all identifiers that are currently defined in a given scope.

In the terminology of programming languages, first-class objects are instances of a type that can be assigned to an identifier, passed as a parameter, or returned by a function.
In Python, functions and classes are also treated as firts-class objects.

Some existing modules in Python's standard library:
* `array` - provides compact array storage for primitive types.
* `collections` - defines additional data structures and abstract base classes involving collections of objects.
* `copy` - defines general functions for making copies of objects.
* `heapq` - provides heap-based priority queue functions.
* `math` - defines common mathematical constants and functions.
* `os` - provides support for interaction with the operating system.
* `random` - provides random number generation.
* `re` - provides support for regular expressions.
* `sys` - provides additional level of interaction with the Python interpreter.
* `time` - provides support for measuring time, or delaying a program.

This is not the entire standard library, but the modules that are particular important in this book.

#### Pseudo-Random Number Generation
To generate pseudo-random numbers Python uses a technique known as a Mersenne twister.
Sequences generated by these techniques can be proven to be statistically uniform, which is usually good enough for most application.
For applications, such as computer sequrity settings, where one needs unpredicatble random sequences, this kind of formula should not be used.

The next number in a pseudo-random generator is determined by the previous number(s), such a generator needs a place to start, which is called its seed.
The sequence of numbers generated for a given seed will always be the same.

## Part II - Object-Oriented Programming
### Chapter 2.1 - Goals, Principles, and Patterns
Each object is an instance of a class. 
Each class presents to the outside world a concise and consistent view of the objects that are instances of this class.
The class definition typically specifies instance variables, also known as data members, that the object contains, as well as the methods, also known as member functions, that the object can execute.

Software implementations should achieve robustness, adaptability, and reuseability. 

**Robustness**:
We want software to be robust, that is, capable of handling unexpected inputs that are not explicitely defined for its application.

**Adaptability**:
Software needs to be able to evolve over time in response to changing conditions in its environment. 
Thus, another important goal of quality software is that it achieves adaptability (also called evolvability).
Related to this concept is portability, which is the ability of software to run with minimal change on different hardware and operating systems.

**Reusability**:
Software should be reusable, that is, the same code should be usable as a component of different systems in various applcations.

Chief among the principles of the object-oriented approach, which are intended to facilitate the goals outlined above, are the following:
* Modularity
* Abstraction
* Encapsulation 

**Modularity**:
Modularity refers to an organizing principle in which different components of a software system are divided into separate functional units.
In Python a module is a collection of closely related functions and classes that are defined together in a single file of source code.
Using modularity increases robustness because it is easier ot test and debug separate componentes before they are integrated into a larger system.

**Abstraction**:
The notion of abstraction is to distill a complicated system down to its most fundamental parts.
Applying the abstraction paradigm to the design of data structures gives rise to abstract data types (ADTs).
An ADT is a mathematical model of a data structure that specifies the type of data stored, the operations supported on them, and the types of parameters of the operations.
An ADT specifies what each operation does, but not how it does it.
We will typically refer to the collective set of behaviors supported by an ADT as its public interface.
Python has a tradition of treating abstractions implicitly using a mechanism known as duck typing.
More formally, Python supports abstract data types using a mechanism known as an abstract base class (ABC).
An abstract base class cannot be instantiated, but it defines one or more common methods that all implementations of the abstraction may have.
An ABC is realized by one or more concrete classes that inherit from the abstract base class while providing implementations for those methods declared by the ABC.
Python's `abc` module provides formal support for ABCs.
We will make use of several existing ABCs coming from Python's `collections` module, which includes definitions for several common data structure ADTs and concrete implementations of some of those abstractions. 

**Encapsulation**:
Different componenets of a software system should not reveal the internal details of their respective implementations.
One of the main advantages of encapsulation is that it gives one programmer freedom to implement the details of a component, without concern that other programmers will be writing code that intricately depends on those internal decisions.
The only constraint on the programmer of a component is to maintain the public interface for the component, as other programmers will be writing code that depends on that interface.

**Design Patterns**:

A design pattern describes a solution to a "typical" software design problem.
A pattern provides a general template for a solution that can be applied in many different situations.
It describes the main elements of a solution in an abstract way that can be specialized for the problem at hand.
It consists of a name, which identifies the pattern; a context, which describes the scenarios for which this pattern can be applied; a template, which describes how the pattern is applied; and a result, which describes and analyzes what the pattern produces.

The design patterns used in this book fall into two groups - patterns for solving algorithm design problems and patterns for solving software engineering problems.

The algorithm design patterns that is used include the following:
* Recursion.
* Amortization.
* Divide-and-conquer.
* Prune-and-search, also known as decrease-and-conquer.
* Brute force.
* Dynamic programming.
* The greedy method.

The software engineering patterns used include the following:
* Iterator.
* Adapter.
* Position.
* Composition.
* Template method.
* Locator.
* Factory method.

### Chapter 2.2 - Software Development
Three major steps of software development:
1. Design
2. Implementation
3. Testing and Debugging

It is in the design step that we decide how to divide the workings of our program into classes, we decide how these classes will interact, what data each will store, and what actions each will perform.

Bottom-up testing proceeds from lower-level components to higher-level components.
Thus, bottom-level functions, which do not invoke other functions, are tested first, followed by functions that call only bottom-level functions, and so on.
This form of testing is usually described as unit testing, as the functionality of a specific component is tested in isolation of the larger software project.
If used properly, this strategy better isolates the cause of errors to the component being tested, as lower-level components upon which it relies should have already been thoroughly tested.
It is common to put tests for code in modules/libraries is the `if __name__=='__main__':` section.
More robust support for automation of unit testing is provided by Python's `unittest` module.
This framework allows the grouping of individual test cases into larger test suites, and provides support for executing those suites, and reporting or analyzing the result of those tests.

A better way to debug is using a debugger, which is a specialized environment for controlling and monitoring the execution of a program.
The basic functionality of a debugger is inserting checkpoints within the code.

### Chapter 2.3 - Class Definitions
In Python, every piece of data is represented as an instance of some class.
A class provides a set of behaviors in the form of member functions (methods), with implementations that are common to all instances of that class.
A class also serves as a blueprint for its instances, effectively determining the way that state information for each instance is represented in the form of attributes (also known as fields, instance variables, or data members).

By default, the `+` operator is undefined for a new class.
This can be changed by using a technique known as operator overloading.
This is done by implementing a specially named method, `add` for the `+` operator.
As a general rule, if a particular special method is not implemented in a user-defined class, the standard syntax that relies upon that method will raise an exception.

An iterator for a collection provides one key behavior: It supports a special method named `__next__` that returns the next elelment of the collection, if any, or raises a `StopIteration` exception to indicate that there are no further elements.

Python helps by providing an automatic iterator implementation for any class that defines both __len__ and __getitem__. 

The `range` method used to be a function that returned a `list` in Python 2.
This was expensive in memory.
In Python 3 it uses a strategy known as lazy evaluation.
Rather than creating a new `list` instance, `range` is a class that can effectively represent the desired range of elements without ever storing them explicitely in memory.
A `range` instantiation supports both the __len__ and __getitem__ methods, and therefore inherits automatic support for iteration.

### Chapter 2.4 - Inheritance
A hierarchical design is useful in software development, as common functionality can be grouped at the most general level, thereby promoting reuse of code, while differentiated behaviors can be viewed as extensions of the general case.
In OOP, the mechanism for modular and hierarchical organization is a technique known as inheritance.
This allows a new class to be defined based upon an existing class as a starting point.
In object-oriented terminology, the existing class is typically described as the *base class*, *parent class*, or *super-class*, while the newly defined class is known as the *subclass* or *child class*.

A subclass may specialize an existing behavior by providing a new implementation that overrides an existing method.
A subclass may also extend its superclass by providing brand new methods.



### Chapter 2.5 - Namespaces and Object-Orientation

## Part III - Algorithm Analysis

## Part IV - Recursion

## Part V - Array-Based Sequences

## Part VI - Stacks, Queues, and Deques

## Part VII - Linked Lists

## Part VIII - Trees

## Part IX - Priority Queues

## Part X - Maps, Hash Tables, and Skip Lists

## Part XI - Search Trees

## Part XII - Sorting and Selection

## Part XIII - Text Processing

## Part XIV - Graph Algorithms

## Part XV - Memory Management and B-Trees

