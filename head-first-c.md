# Head First C


## Introduction
If you really want to learn, and you want to learn more quickly and more deeply, pay attention to how you pay attention.
Think about how you think .
Learn how you learn.

The trick is to get your brain to see the new matereial you're learning as Really Important.
Crucial to your well-being.

The fast way to do this is to do anything that increases brain activity, espcially different types of brain activity.

Here's what you can do to bend your brain into submission:
1. Slow down. The more you understand, the less you have to memorize.
2. Do the exercises. Write your own notes.
3. Read "There Are No Dumb Questions".
4. Make this the last thing you read befoire bed. Or at least the last challenging thing.
5. Talk about it. Out loud.
6. Drink water. Lots of it.
7. Listen to your brain.
8. Feel something.
9. Write a lot of code.

The activities in the book are NOT optional.
The redundancy is intentional and important.
The examples are as lean as possible.
The Brain Power Exercises don't have answers.

## 1 - Getting Started with C: Diving In
C is a low-level language, lower level than most others.
Thus, learning C means learning what really goes on in the computer.

C code is compiled into machine code using a compiler.
To compile C code using GCC use the command: `gcc file.c -o output`.
The compiler checks for errors and if none are found it compiles the C program into binary.
This new file is executable.

There are three main C standards:
1. ANSI C from the late 80s.
2. C99 from 1999.
3. C11 from 2011.

`puts("string");` displays a sting on the command prompt or terminal.

Braces define block statements.
Block statements allow you to treat a whole set of statements as if they were a single statement. 

`scanf("%19f", ex);` means store everything the user types in in the `ex` array.

The `switch` statement checks a single variable for different value.
```c
#include <stdio.h>

int main() 
{
    char suit = 'H';
    switch(suit) {
    case 'C':
        puts("Clubs");
        break;
    case 'H':
        puts("Hearts");
        break;
    case 'D':
        puts("Diamonds");
        break;
    default:
        puts("Spades");

    return 0;
}
```

The above example of `switch` will check first whether the suit is `C`, then `H`, then `D`, and if the suit is none of the above it will default to spades.

The structure of C source files are usually like follows:
1. Comments describing the purpose of the file, license or copyright information.
   There is no need to include this information but it is good practice.
2. `include` section.
   This is the section where external libraries are loaded.
3. Functions and the `main()` function.
   All C code runs inside functions.
   The `main()` function is the starting point for all of the code in your program.

The `cards` program written on page 5 uses `printf()`, to get it to compile remember to include `<stddef.h>` as the `size_t` var is in there as per C99.
The `printf()` function is used to display formatted output.
It replaces format characters with the values of variables, like this:
```c
printf("%s says the count is %i", "Ben", 21);
```
Where `%s` is replaced with `"Ben"` and `%i` is replaced with `21`.
You can include as many parameters as you like when you call the `printf()` function, but make sure you have a matching `%` format character for each one.

If there is no `main()` function in your program it wont be able to start.
The return type of `main()` is `int`, which is used to determine whether or not the program ran successfully.
If the return value is `0` the program ran successfully, and if `1` it did not run successfully.
The return values are something you must specify yourself.
If you want to check the exit status of a program type: `echo $?`.

If we have a variable of type `char` we can index it like follows `var[0]` which will take the first character of the variable.

Line comments can be made using `//` in C99 or later.

In the `cards.c` example on p11 uses an array of characters.
The base C language does not support strings.
So when working with strings in base C we use an array if characters.
Strings are just character arrays.
When C sees a stirng like `s = "Shatner` it reads it like it was just an array of separate characters `s = {'S', 'h', 'a', 't', 'n', 'e', 'r' }`.

C doesn't always know how long an array of characters is, therefore it adds a sentinel character like `\0`.
Thus when it sees `s = "Shatner"` what is read and stored into memory is `s = {'S', 'h', 'a', 't', 'n', 'e', 'r', '\0'}`.

This is why we define character array variables like `card_name` like this `char card_name[3];`.
The `card_name` string is ony ever going to record one or two characters, but because strings end in a sentinel character we have to allow for an extra character in the array.

Single quotes are used for individual characters, but double quotes are always used for strings.

A bus error means that your program cannot update a piece of memory.

The `&&` is the *and* operator which evaluates to true only of both conditionas given are true.
The `||` is the *or* operator which checks if either condition given is true.
The `!` is the *not* operator, it reverses the value of a condition.

In C, boolean valæues are represented by numbers.
To C, teh number 0 is the value for false, anything that is not equal to 0 is treated as true.

The GCC compiler can compie C, C++, Objective-C, Pascal, Fortran, PL/I, and Go.
The GCC compiler has a frontend and a backend.
The frontend is responsible for interacting with the human-readable source code like C.
It converts it into intermediate code. 
The backend then converts the intermediate code into machine code that is understandable on many platforms.
The GCC compiler also spots code errors and check the performance of the code and optimizes it if that is needed.

When you are using several `if` statements to check the same value, it might be cleaner to use a `switch` statement.

The `switch` statement checks a single value, when it hits a true `case` statement it will run the code under the value.
It will continue to run until it hits a `break`.
The advantages of the `switch` statement are clarity and that you can use fall-through logic to reuse sections of code for different cases.
You cannot use a `switch` statement to check strings or any kind of arrays, the `switch` statement will only check a single value.


## 2 - Memory and Pointers: What Are You Pointing At?

## 2.5 - Strings: String Theory

## 3 - Creating Small Tools: Do One Thing and Do It Well

## 4 - Using Multiple Source Files: Break it Down, Build it Up

## C Lab 1 - Arduino

## 5 - Structs, Unions, Bitfields: Rolling Your Own Structures

## 6 - Data Structures and Dynamic Memory: Building Bridges

## 7 - Advanced Functions: Turn Your Functions Up To 11

## 8 - Static and Dynamic Libraries: Hot-Swapable Code

## C Lab 2 - OpenCV

## 9 - Processes and System Calls: Breaking Boundaries

## 10 - Interprocess Communication: It's Good to Talk

## 11 - Sockets and Networking

## 12 - Threads: It's A Parallel World

## C Lab 3 - Blasteroids

## i - Leftovers: The Top Ten Things (We Didn't Cover)

## ii - C Topics: Revision Roundup 
