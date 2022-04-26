# Structure and Interpretations of Computer Programs
**Authors**: Harold Abelson and Gerald Jay Sussman

## Foreword
It doesn't matter much what the programs you are making are about or what applications they serve.
What matters is how well they perform and how smoothly they fit with other programs in the creation of still greater programs -> The UNIX philosophy.

Every computer program is a model, hatched in the mind, of a real mental process.
They are handcrafted discrete collections of symbols, mosaics of interlocking functions, they continually evolve: we change them as our perception of the model deepens, enlarges, generalizes until the model ultimately attains a metastable place within still another model with which we struggle.

Since large programs grow from small ones, it is crucial that we develop an arsenal of standard program structures of whose correctness we have become sure and learn to combine them into larger structures using organizational techniques of proven value.

The native data structure of Lisp is the list.
The simple structure and natural applicability of lists are reflected in functions that are amazingly nonideosyncratic.

## Preface
The computer is a novel formal medium for expressing ideas about methodology.
Programs must be written for people to read and only incidentally for machines to execute.
The essential material to be addressed by a subject at this level is the techniques used to control the intellectual complexity of large software systems.

## 1 - Building Abstractions with Procedures
Computer processes is the abstract methods that a computer uses, they can manipulate another abstract being, the data, and a program is a method of directing processes.

Lisp was invented in the late 1950s as a formalism for reasoning about the use of certain kinds of logical expressions, called *recursion equations*, as a model for computation.
The language is based on the paper *Recursive Functions of Symbolic Expressions and Their Computation by Machine* by John McCarthy.

### 1.1 - The Elements of Programming
When describing and creating a language, pay attention to the means that the language provides for combining simple ideas to form more complex ideas.
Every powerful language has three mechanisms for accomplishing this:
* **primitive expressions**, which represent the simplest entities the language is concerned with. 
* **means of combination**, by which compound elements are built from simpler ones.
* **means of abstraction**, by which compound elements can be named and manipulated as units.

The *environment* (or *global environment*) is the program's memory of what name-object pairs are defined in the program.

The Lisp interpreter is itself following a procedure when evaluating combinations:
1. Evaluate the subexpression of the combination.
2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).
The evaluation rule above is recursive in nature, as it applies itself to subexpressions, to evaluate the entire combination.
When thinking about the evaluation rule applied to complex combinations, we can imagine the evaluation as evaluating a tree of expressions, where individual nodes are expressions, branches are arguments, and the evaluated expression is the root.

When applying the evaluation rule, you will end up with having to evaluate primitives. 
Thus, every complex combination can be simplified (or expanded) to an evaluation of primitives.

The `define` keyword is not a primitive, but a special form.
Special forms have specific evaluation rules.

The general form of a procedure definition is:
```scheme
(define (<name>) <formal parameters>)
  <body>)
```
The `name` is a symbol to be associated with the procedure definition in the environment.
The `formal parameters` are the names used within the body of the procedure to refer to the corresponding arguments of the procedure.
The `body` is an expression that will yield the value of the procedure application when the formal parameters are replaced by the actual arguments to whih the procedure is applied.

*Normal-order evaluation* is done by fully expanding the procedure first and then evaluating it.
*Applicative-order evalaution* is done by evaluating subexpressions of the procedure recursively.

The construct of applying different procedures based on the value of something is called a *case analysis*.
In Lisp the notation for case analysis is done by `cond`:
```scheme
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) x)
        ((< x 0) (-x))))
```
The individual cases are called *clauses*.
The first expression in each clause is a *predicate* - that is, an expression whose value is interpreted as either true or false.
If none of the clauses is found to be true, the value of the `cond` is undefined.

There is an important difference between mathematical functions and computer procedures: Procedures must be effective.
The contrast between function and procedure is a reflection of the general distinction between describing properties of things and describing how to do things, or the destinction between declarative knowledge and imperative knowledge.

The `sqrt-iter` function implemented demonstrates how iteration can be accomplished using no special construct other than the ordinary ability to call a procedure.

The importance of the decomposition strategy is that it is crucial that each procedure accomplishes an identifiable task that can be used as a module in defining other procedures.
Think of this in relation to the UNIX philosophy *do one thing well and provide means of combining with others*.
By doing this we do not need to concern ourselves with exactly how the larger procedures that the procedure will be used in is going to function.

Having local/bound variables in procedures are important.
If we did not have this, the evaluation of one procedure might depend on the evaluation of another procedure.
Thus, variable values would be changing as we run the program, and the order of operations would become a complicating matter.

To simplify our programs, we can write local procedures within the main procedures we are creating.
Doing this, nesting procedures within other procedures, is called block structure.
Using block structure allow us to keep procedures local, but more importantly, it allows us to simplify the procedures, as we can reuse code.

### 1.2 - Procedures and the Processes They Generate
A procedure is a pattern for the local evolution of a computational process.
A recursive process is characterized by a chain of deferred operations. 
Carrying out this process requires that the interpreter keep track of the operations to be performed later on.
A recursive process where the amount of information to keep track of grows linearly with n is a linear recursive process.

An iterative process is one whose state can be summarized by a fixed number of state variables, together with a fixed rule that describes how te state 

## 2 - Building Abstractions with Data

## 3 - Modularity, Objects, and State

## 4 - Metalinguistic Abstraction

## 5 - Computing with Register Machines

