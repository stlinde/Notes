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


## Part II - Object-Oriented Programming

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

