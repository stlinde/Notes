# Grokking Algorithms: An illustrated guide for programmers and other curious people.
**Author**: Aditya Y. Bhargava

## Preface
Written by a self-taught software developer with a illustrative learning style.

## About This Book
Core concepts are reinforced with exercises and multiple explanations. 
Execute the code for the examples yourself.
Do the exercises.

## 1 - Introduction to Algorithms
* Foundation for the rest of the book. 
* Write your first search algorithm (binary search).
* Learn how to talk about the running time of an algorithm (Big O notation).
* Introduced to a common technique for designing algorithms (recursion).

### 1.1 - Introduction
Algorithm -> Set of instructions for accomplishing a task.
Algorithms are usually already available in most programming languages.
These are useless if you don't understand the trade-offs.

### 1.2 - Binary Search
Binary search:
* Input: **Sorted** list of elements.
* Output: If element is in list, return position, otherwise return `null`.
The basic idea is:
1. Start with the middle element of the array.
2. Check if it is the item we want -> Return if true.
3. If not true -> Check if item is higher or lower.
4. If lower, take from the middle to the beginning and start over.
5. If higher, take from the middle to the end and start over.
Binary search runs in logarithmic time.

### 1.3 - Big O Notation
Big O notation tells us about the speed and space needed of the algorithm with changes in input size.
Thus, Big O notation is about the growth rate of the time and space needed of an algorithm.
Big O notation cares about the worst case performance.

The main takeaways:
* Algorithm speed isn't measured in seconds, but in growth of the number of operations.
* Instead, we talk about how quickly teh run time of an algorithm increases as the size fo the input increases.
* Run time of algorithms is expressed in Big O notation.
* `O(log n)` is faster than `O(n)`, but it gets a lot faster as the list of items you're searching grows.

The traveling salesman problem runs in `O(n!)` time, or factorial time.

### 1.4 - Recap
* Binary search is a lot faster than simple search.
* `O(log n)` is faster than `O(n)`, but it gets a lot faster once the list of items you're searching through grows.
* Algorithm speed isn't measured in seconds.
* Algorithm times are measured in terms of the growth of an algorithm.
* Algorithm times are written in Big O notation.

## 2 - Selection Sort
### 2.1 - How Memory Works
Each time you want to store an item in memory, you ask the computer for some space, and it gives you an address where you can store your item.
If you want to store multiple items, there are two basic ways to do so: arrays and lists.
There isn't one right way to store items for every use case, so it's important to know the difference.

### 2.2 - Arrays and Linked Lists
Adding new items to an array can be a big pain.
If the array is held in a memory location where no more space is available, you need to move the array to a new location in memory, and this an be slow.
One workaround is to allocate memory to the array beforehand.
This has its downsides too though:
* All of the allocated space may not be needed, leaving you with wasted memory.
* More memory may be needed than the allocated amount, thus having to move the array anyways.

In a linked list, all elements of the list is stored randomly in memory.
Every element then holds the address of the next element of the list.
Adding a new element to the linked list, thus means that your list just needs to be updated with a new address.
The issue with linked lists is that when you want to read a certain element in the linked list, you must traverse the linked list until you reach that element.

Here arrays are different as you know the address of every item in your array, and thus can jump right to the element you want to read.

Reading runs in `O(n)` time in linked lists and insertion in `O(1)` time.
In arrays reading runs in `O(1)` time and insertion in `O(n)` time.

### 2.3 - Selection Sort
Selection sort is the naive sorting algorithm:
* Go over the original list and find the highest (lowest) element and add to new list.
* Continue until the original list is empty.
This runs in exponential time, `O(n^2)`.

### 2.4 - Recap
* Your computer's memory is like a giant set of drawers.
* When you want to store multiple elements, use an array or a linked list.
* With an array, all your elements are stored right next to each other.
* With a linked list, elements are strewn all over, and one element stores the address of the next one.
* Arrays allow fast reads.
* Linked lists allows fast inserts and deletes.
* All elements in the array should be the same type.

## 3 - Recursion
### 3.1 - Recursion
Recursion is used when it makes the solution clearer.
There is no performance benefit to using recursion; in fact, loops are sometimes better for performance.
> "loops may achieve a performance gain for your program. Recursion may achieve a performance gain for your programmer. Choose which is more important in your situation!"
Leigh Caldwell

### 3.2 - Base Case and Recursive Case
Every recursive function has two parts:
* Base Case: when the function terminates.
* Recursive Case: the function calls itself.

### 3.3 - The Stack
The call stack is an important concept in general programming, and it's also important to understand when using recursion.

The stack is a simple data structure where you add items to the top of a stack and retrieve them from the top of the stack again.

The computer uses a call stack that keeps track of functions (or other structures) being called by your program. 
The first function call will be at the bottom of the stack, and every consecutive function call will be added on top.
When a function is finished (returns something) that function is popped of the stack.

### 3.4 - Recap
* Recursion is when a function calls itself. 
* Every recursive function has two cases: the base case and the recursive case.
* A stack has two operations: push and pop.
* All function calls go onto the call stack.
* The call stack can get very large, which takes up a lot of memory.

## 4 - Quicksort
### 4.1 - Divide & Conquer
Divide & Conquer gives you a new way to think about solving problems.

To solve a problem using D&C, there are two steps:
1. Determine the base case. This should be the simplest possible case.
2. Divide or decrease your problem until it becomes the base case. 


### 4.2 - Quicksort

### 4.3 - Big O Notation Revisited

### 4.4 - Recap

## 5 - Hash Tables
### 5.1 - Hash Functions

### 5.2 - Use Cases

### 5.3 - Collisions

### 5.4 - Performance

### 5.5 - Recap

## 6 - Breadth-First Search
### 6.1 - Introduction to Graphs

### 6.2 - What is a Graph?

### 6.3 - Breadth-First Search

### 6.4 - Implementing the Graph

### 6.5 - Implementing the Algorithm

### 6.6 - Recap

## 7 - Dijkstra's Algorithm
### 7.1 - Working with Dijkstra's Algorithm

### 7.2 - Terminology

### 7.3 - Trading for a Piano

### 7.4 - Negative-Weight Edges

### 7.5 - Implementation

### 7.6 - Recap

## 8 - Greedy Algorithms
### 8.1 - The Classroom Scheduling Problem

### 8.2 - The Knapsack Problem

### 8.3 - The Set-Covering Problem

### 8.4 - NP-Complete Problems

### 8.5 - Traveling Salesperson, Step by Step

### 8.6 - Recap

## 9 - Dynamic Programming
### 9.1 - The Knapsack Problem

### 9.2 - Knapsack Problem FAQ

### 9.3 - Longest Common Substring

### 9.4 - Recap

## 10 - K-Nearest Neighbors
### 10.1 - Classifying Oranges vs. Grapefruit

### 10.2 - Building a Recommendations System

### 10.3 - Introduction to Machine Learning 

### 10.4 - Recap

## 11 - Where to Go Next
### 11.1 - Trees

### 11.2 - Inverted Indexes

### 11.3 - The Fourier Transform

### 11.4 - Parallel Algorithms

### 11.5 - MapReduce

### 11.6 - Bloom Filters and HyperLogLog

### 11.7 - The SHA Algorithms

### 11.8 - Locality-Sensitive Hashing

### 11.9 - Diffie-Hellman Key Exchange 

### 11.10 - Linear Programming

### 11.11 - Epilogue
