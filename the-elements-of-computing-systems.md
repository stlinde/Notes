# The Elements of Computing Systems: Building a Modern Computer from First Principles
**Authors**: Noam Nisan and Shimon Schocken

## Preface
This book exposes students to a significant body of computer science knowledge.
The following topics are illustrated in a hands-on fashion:
* *Hardware*: Logic gates, Boolean arihtmetic, multiplexors, flip-flops, registers, RAM units, counters, Hardware Description Language (HDL), chip manipulation and testing.
* *Architecture*: ALU/CPU design and implementation, machine code, assembly language programming, addressing modes, memory-mapped input/output (I/O). 
* *Operating systems*: Memory Management, math library, basic I/O drivers, screen management, file I/O, high-level support.
* *Programming languages*: Object-based design and programming, abstract data types, scoping rules, syntax and semantics, references.
* *Compilers*: Lexical analysis, top-down parsing, symbol tables, virtual stack-based machine, code generation, implementation of arrays and objects.
* *Data structures and algorithms*: Stacks, hash tables, lists, recursion, arithmetic algorithms, geometric algorithms, running time considerations.
* *Software engineering*: Modular design, the interface/implementation paradigm, API design and documentation, proactive test planning, programming at the large, quality assurance.

The first five chapters deal with constructing the hardware platform of a simple modern computer.
The remaining seven chapters describe the design and implementation of a typical multi-tier software hierarchy, culminating in the construction of an object-based programming language and a simple operating system.

This book is based on an *abstraction-implementation* paradigm.
Going from the background and abstract concepts to the implementation and how to of the object of study.

Each chapter includes a complete description of a stand-alone hardware or software development project.


## Introduction: Hello, World Below
You are about to learn thre things:
* How computers work. 
* How to break down complex problems into manageable modules.
* How to develop large-scale hardware and software systems.

## 1 - Boolean Logic
Start with the logic gate `NAND` and build all other logic gates from it.

### 1.1 Background
We will use a common arithmetic-like notation for Boolean expressions:
* `x * y` (or `xy`) - means "x and y".
* `x + y` - means x or y.
* `x_bar` - means not x.

Every Boolean expression can be expressed using three Boolean operators only: And, Or, and Not.
The Nand function (as well as the Nor function) has an interesting theoretical property: Each one of the operations And, Or, and Not can be constructed from it, and it alone.
Therefore, it follows that every Boolean function can be constructed from Nand operations alone.

A gate is a physical device that implements a Boolean function.
If a Boolean function *f* operates on *n* variables and returns *m* binary results, the gate that implements *f* will have *n input pins* and *m output pins*.
LIke Boolean functions can be expressed in terms of simpler functions, complex gates are composed from more elementary gates.
The simplest gates are all made from tiny switching devices, alled transistors.

A *primitive gate* can be viewed as a black box device that implements an elementary logical operation in one way or another - we don't care how.
A hardware designer starts from such primitive gates and designs more complicated functionality by interconnecting them, leading to the construction of *composite gates*.

Hardware designers plan an optimize the chip architecture using structured modeling formalisms like *Hardware Description Language* (also known as VHDL, v for virtual).
Using VHDL one can completely plan, debug, and optimize the entire ship before a single penny is spent on actual production.

I will be using Go to run all the code and simulations within.



## 2 - Boolean Arithmetic
In this chapter we build gate logic designs that represent numbers and perform arithmetic operations on them.
Our starting point is the set of logic gates built in chapter 1, and our ending point is a fully functional Arithmetic Logical Unit (ALU).
This is the centerpiece chip that executes all arithmetic and logical operations performed by the computer.

Binary addition is a simple operation that runs deep.
Remarkably, most of the operations performed by digital computers can be reduced to elementary additions of binary numbers.
Therefore, constructive understanding of binary addition holds the key to the implementation of numerous computer operations that depend on it, one way or another.

The value of a binary pattern like "10011" can be computed by the following code:
```
bin = "10011"
value = 0
for i in range(len(bin)):
   value += bin[i] * 2^i
```
Thus, the value of "10011" will be: 1 * 2^4 + 0 * 2^3 + 0 * 2^2 + 1 * 2 ^ 1  + 1 * 2^0 = 19.

A pair of binary numbers can be added digit by digit from right to left, according to the same method used for decimal addition.
First we add the two right-most digits, also called the *least significant bits* (LSB) of the two binary numbers (this holds only in big-endian systems).
Next, we add the resulting carry bit (either 0 or 1) to the sum of the next pair of bits up the significance ladder. 
We continue the process until the two most significant bits (MSB) are added.
If the last bit-wise addition generates a carry of 1, we can report overflow; otherwise, the addition completes successfully.

We see that computer hardware for binary addition of two n-bit numbers can be built from logic gates designed to calculate the sum of three bits (pair of bits plus carry bit).
The transfer of the resulting carry bit forward to the addition of the next significant pair of bits can be easily accomplished by proper wiring of the 3-bit adder gates.

We use a hierarchy of three adders:
* Half-adder: designed to add two bits.
* Full-adder: designed to add three bits.
* Adder: designed to add two n-bit numbers. 
 
### 2.4 - Perspective
The adder implementation in out ALU is rather inefficient, due to the long delays incurred while the carry bit propaagates from the least significant bit pair to the most significant bit pair.
This problem can be alleviated using logic circuits thawt effect carry look-ahead techniques.

In any given computer, the overall functionality of the hardware/software platform is delivered jointly by the ALU and the operation system that runs on top of it.
Thus, when designing a new computer system, the question of how much functionality the ALU should deliver is essentially a cost/performance issue.
The general rule is that hardware implementations of arithmetic and logical operations are usually costly, but achieves better performance. 
The design trade-off that we have chosen in this book is to specify an ALU hardware with limited functionality and then implement as many operations as possible in software.
For example, our ALU features neither multiplication nor division nor floating point arithmetic.


## 3 - Sequential Logic
All Boolean and arithmetic chips built in the first two chapters were combinational.
Combinational chips compute functions that depend solely on combinations of their input.
These simple chips provide many important processing functions (like the ALU), but they cannot maintain state.
Since computers must be able to not only compute values but also store and recall values, they must be equipped with memory elements that can preserve data over time
These memory elements are built from sequential chips.

The implementation of memory elements is an intricate art involving synchonization, clocking, and feedback loops.
Most of this complexity can be embedding in the operating logic of very low-level sequential gates called *flip-flops*. 
From these we can specify and build all memory devices employed by typical modern computers, from binary cells toi registers to memeory banks and counters.

### 3.1 - Background
In most computers, the passage of time is represented by a master clock that delivers a continuous train of alternating signals.
The exact hardware implementation is usually based on an oscillator that alternates continously between two phases labeled 0-1, low-high, tick-tock.
The elapsed time between the beginning of a "tick" and the end of the subsequent "tock" is called cycle, and each clock cycle is taken to model one discrete time unit.

The most elementary element in the computer is a device called a *flip-flop*.
There are several variants, but we use a data flip-flop, or DFF, whose interface consists of single-bit data input and a single-bit data output.
The DFF has a clock input that changes continuously according to the master clock's signal.
Taken together, the data and the clock inputs enable the DFF to implement the time-based behavior *out(t) = in(t-1)*, where in and out are the gate's input and output values and t is the current clock cycle.
The DFF simply outputs the input value from the previous time unit.

A *register* is a storage device that can store a value over time, implementing the classical storage behavior *out(t) = out(t-1)*.
The register cannot be implemented by feeding the output of a flip-flop back into the input.
Rather there must be a way to load data, and thus is done through a load gate, which is implemented by a multiplexor.
The select bit of the multiplexor thus serves as a load bit - if = 1 -> load new bit, if = 0 -> load output from self.

Using the 1-bit registers we can construct arbitrarily wide registers.
This can be achieved by forming an array of as many single-bit registers as needed, creating a register that holds multi-bit values.
The basic design parameter of such a register is its *width* - the number of bits that it holds - e.g. 16, 32, 64.
The multi-bit contents of such registers are typically referred to as words.

With the ability to represent words, we can build memory banks of arbitrary length.
This can be done by stacking many registers together to form a *Random Access Memory* (RAM) unit.
The term random access memory derives from the requirement that read/write operations on a RAM should be able to access randomly chosen words, with no restriction on the order in which they are accessed.
We require that any word in teh memory - irrespective of its physical location - be accessed directly, in equal speed.
This is satisfied by assigning each word in the n-register RAM a unique address, according to which it will be accessed.
Second, in addition to building an array of n registers, we build a gate logic design that, given an address j, is capable of selecting the individual registers whose address is j.

In sum, a classical RAM device accepts three inputs: a data input, an address input, and a load bit.
The address specifies which RAM register should be accessed in the current time unit. 
In case of a `read` operation (`load=0`), the RAM's output immediately emits the value of the selected register. 
In the case of a write operation (`load=1`), the selected memory registers commits to the input value in the next time unit, at which point the RAM's output will start emitting it.
The basic design parameters of a RAM device are its data width - the width of each one of its words, and its size - the number of words in the RAM.

 A counter is a sequential chip whose state is an integer number that increments every time unit, effecting the function *out(t) = out(t-1) + c* where *c* is typically 1.
 Counters play an important role in digital architectures.
 A CPU includes a program counter whose output is interpreted as the address of the instruction that should be executed next in the current program.
 A counter chip can be implemented by combining the input/output logic of a standard register with the combinatorial logic for adding a constant.
 Typically, the counter will have to be equipped with some additional functionality, such as possibilities for resetting the count to zero, loading a new counteing base, or decrementing instead of incrementing.



 A counter is a sequential chip whose state is an integer number that increments every time unit, effecting the function *out(t) = out(t-1) + c* where *c* is typically 1.
 Counters play an important role in digital architectures.
 A CPU includes a program counter whose output is interpreted as the address of the instruction that should be executed next in the current program.
 A counter chip can be implemented by combining the input/output logic of a standard register with the combinatorial logic for adding a constant.
 Typically, the counter will have to be equipped with some additional functionality, such as possibilities for resetting the count to zero, loading a new counteing base, or decrementing instead of incrementing.




## 4 - Machine Language

## 5 - Computer Architecture

## 6 - Assembler

## 7 - Virtual Machine I: Stack Arithmetic

## 8 - Virtual Machine II: Program Control

## 9 - High-Level Language

## 10 - Compiler I: Syntax Analysis

## 11 - Compiler II: Code Generation

## 12 - Operating System

## 13 - Postscript: More Fun to Go

