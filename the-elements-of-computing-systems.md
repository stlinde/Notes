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
 

## 3 - Sequential Logic

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

