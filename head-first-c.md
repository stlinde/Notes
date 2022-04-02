# Head First C

***Authors***: David Griffiths & Dawn Griffeths


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

Loops control how many times a piece of code will be run.
A `while` loop runs the code attached to it while some condition remains true.
The `while` loop is structured as follows:
```c
while (<some condition>) {
    ... /* Do something here */
}
```
If the condition evaluates to `false` at the first loop, then the code will never be run.
If we want to ensure that the code is run at least once we can use a `do ... while` loop, as follows:

```c
do {
    ... /* Do something here */
} while(<some condition>)
```

A loop often follows the structure as follows:
1. Do something simple before the loop, like set a counter.
2. Have a simple test condition on the loop.
3. Do something at the end of a loop, like update a counter.

The `for` loop makes this structure simple.
The below `while` loop can be written more simply as a `for` loop.
```c
int counter = 1;
while (counter < 11) {
    printf("%i green bottles, hanging on a wall\n", counter);
    counter++;
}
```
The `for` loop version fo the above while loop:
```c
for (counter =1; counter <11; counter++) {
    printf("%i green bottles, hanging on a wall\n", counter);
}
```
The first argument in the parenthesis initializes the loop variable, the second is the condition, the third is the code that will run after the loop.

To break out of a loop if some condition is met you can use the `break` statement.
The `break` statement will break the loop and skip whatever follows inside the loop.
Avoid using too many break statements as they might make your code hard to read.
Furthermore, `break` statements do not break `if` statements.

To continue to the next iteration of the loop you can use the `continue` statement.

All functions in C follow the same format.
They all contain the following:
* A return type (`int` in the `main()` function).
* A function name (`main` is the name of the `main()` function).
* A body which is surrounded by brackets. 
* A `return` statement (unless the return type is `void`).

Furthermore, a function can take parameters or arguments, stated between the parentheses after the function name.

The return type `void` can be given to functions that does not have anything meaningful to return.
In C, the keyword `void` means it does not matter.


**Bullet Points**
* A `while` loop runs code as long as its condition is true.
* A `do-while` loop is similar, but runs the code at least once.
* A `for` loop is a more compact way of writing certain kinds of loops.
* You can exit a loop at any time with `break`.
* You can skip the loop condition at any time with `continue`.
* The `return` statement returns a value from a function.
* `void` functions don't need `return` statements.
* Most expressions in C have values.
* Assignments have values so you can chain them together (`x = y = 0`).




## 2 - Memory and Pointers: What Are You Pointing At?
C gives you great control over how your program handles memory, and becoming comfortable with pointers and memory addressing is key to mastering C.

A **pointer** is the address of a piece of data in memory.
Pointers are helpful as they allow you to work on the same piece of data rather than copies of the data.
Furthermore, they allow you to pass just the pointer to the address in memory rather than passing all the data.

Everytime you declare a variable in C, the computer creates space for it in memory.
Variables declared inside a function are stored in the **stack**.
Variables declared outside any function are stored in the **globals** section of memory.
The `&` operator returns the address of the variable, as such `&x` returns the address of the `x` in memory.
An address is also what is called a **pointer**.

When you are calling functions with parameters and passing variables as arguments, only the value of the variables will be sent to the function.
Thus, the value of the original variable will not be changed if you change the value of the parameter variables.
To make up for this we can pass pointers.
This will tell the function where the current variable is stored, and then the function will be able to update the values of the original variable.

To get the address of a variable: `&x`.
To read the contents of an address: `*x`.
To change the contents of an address: `*x = 199`.

**Bullet Points**
* Variables are allocated storage in memory.
* Local variables are stored in the stack.
* Global variables are stored in the globals section.
* Pointers are just variables that store memory addresses.
* The `&` operator finds the address of a variable.
* The `*` operator can read the contents of a memory address.
* The `*` can also set the contents of a memory address.


When you create an array, the array variable can be used as a pointer to the start of the array in memory.
The computer will reserve space in memory for all items in the array and the sentinel character`\O`.
The address of the array is the address of the first character.
Thus, when calling the variable the pointer to the first character will be returned.

**Bullet Points**
* An array variable can be used as a pointer.
* The array variable points to the first element in the array.
* If you declare an array argument to a function, it will be treated as a pointer.
* The `sizeof` operator returns the space taken by a piece of data.
* You can also call `sizeof` for a data type, such as `sizeof(int)`.
* `sizeof(pointer)` returns 4 on a 32-bit system and 8 on a 64-bit system.

An operator is compiled to a sequence of instructions by the compiler.
But if the code calls a function, it has to jump to a separate piece of code.

The `sizeof` is an operator, and is therefore calculated at compile-time.

On most systems C compilers make the `long` data type the same size as a memory address.
So if `p` is a pointer and you want to store it in a `long` variable `a`, you can type `a=(long)p`.

If you run `sizeof(array)` within the same scope as the array is declared within, C knows that you want to know the size of the array.

When you create a pointer variable, the machine will allocate 4 or 8 bytes of space to store it.
Thsi is not so with an array.
When creating an array, the computer will allocate space to store the array, but it won't allocate any memory to store the array variable. 
The compiler simply plugs in the address of the start of the array.

But because array variables don't have allocated storage, it means that you can't point them at anything else.

Because array variables are slightly different from pointer variables, you need to be careful when you assign arrays to pointers.
If you assign an array to a pointer variable, then the pointer variable will only contain the address of the array.
The pointer doesn't know anything about the size of the array, so a little information has been lost.
That loss of information is called decay.

Every time you pass an array to a function, you'll decay to a pointer, so it's unavoidable.
But you need to keep track of where arrays decay in your code because it can cause very subtle bugs.

An array variable can be used as a pointer to the first element in any array.
That means that you can read the first element of the array either by using the brackets notation *or* using the `*` operator like this:
`array[0]`
`*array`

But because an address is just a number, that means you can do *pointer arithmetic* and actually *add* values to a ointer value and find the next address.
So you can either use brackets to read the element with index 2, or you can just add 2 to the address of the first element:
```c
printf("3rd order: %i drinks\n", drinks[2]);
printf("3rd order: %i drinks\n", *(drinks + 2));
```

In general the two expressions `drinks[i]` and `*(drinks + i)` are equivalent.
That's why arrays begin with index 0.
The index is just the number that's added to the pointer to find the location of the element.

**Bullet Points**
* Array variables can be used as pointers, but array variables are not quite the same.
* `sizeof` is different for array and pointer variables.
* Array variables cannot point to anything else.
* Passing an array variable to a pointer decays it.
* Arrays start at zero because of pointer arithmetic.
* Pointer variables have types so they can adjust pointer arithmetic.

You need to understand pointer arithmetic as it can be used to process arrays of data efficiently.
You can also subtract numbers from pointers, but be careful that you do not go back before the start of the allocated space in the array.
C does the pointer arithmetic calculations at compile-time.

The `scanf()` function is used for recording user input.
The `scanf()` function accepts a pointer as it's second parameter, the pointer is for storing the input.
When updating the contents of an array functions need the pointer to the array, as we are interested in updating the memory of the array. 
This is why the `scanf()` function takes a pointer and not the value of the array as input
When using `scanf()` for an array, the pointer is automatically passed, as this is what is returned when calling an array variable.
This is not so with other variables.
If we want to change an interger variable for example, we need to pass the pointer to the address of the integer and not the integer value itself.
Thus, the correct use of `scanf()` for integers is `scanf("Enter you integer input: %i", &var)`

Remember to specify the number of characters allowed to enter in the `scanf()` function.
If this is not done, you might run into a segmentation fault.
This is because you were trying to modify memory that is not allocated to the string variable.
Furthermore, if the entered data is too large this might cause a buffer overflow.

An alternative to the `scanf()` function is the `fgets()` function.
The difference is that `fgets()` must be given a max length of input.
The `fgets()` is used as follows `fgets(array, sizeof(array), stdin)`, where `array` is the array that must be updated, `sizeof(array)` is the maximum length of the input, and `stdin` is specifying that the input will come from the keyboard.
The `fgets()` function includes the sentinel character `\0` in the max size.
`fgets()` can read a single string with spaces included, unlike `scanf()`.

If you need to enter *structured data* with several fields, you want to use `scanf()`.
If you are entering a *single unstructured string*, then `fgets()` is probably the way to go.

Constants in C are stored in the constants part of memory in the C program.
A value stored in the constants part of memory is read-only.
String literals are stored as constants.
If you want to make changes to a string literal you must create a copy.

**Bullet Points**
* If you see a `*` in a variable declaration, it means the variable will be a pointer.
* String literals are stored in read-only memory.
* If you want to modify a string, you need to make a copy in a new array.
* You can declare a `char` pointer as `const char *` to prevent the code from using it to modify a string.

 When adding the `const` modifier to a variable you will get a compile-time error if you are trying to change that variable some place else in the program.

#### Memory Memorizer
**Stack**:

This is the section of memory used for local variable storage.
Every time you call a function, all of the function's local variables get created on the stack.
It's called the stack because it is like a stack of plates: variables is added to the stack when you enter a function, and get taken of the stack when you leave.
The stack works upside down.
It starts at the top of memory and grows downward.


**Heap**:

The heap is for dynamic memory: pieces of data that get created when the program is running and then hang around a long time.


**Globals**:

A global variable is a variable that lives outside all of the functions and is visible to all of them. 
Globals get created when the program first runs, and you can update them freely.


**Constants**:

Constants are also created when the program first runs, but they are stored in read-only memory.
Constants are things like string literals that your will need when the program is running, but you will never want them to change.


**Code**:

A lot of operating systems place the code in the lowest memory address. 
The code segment is also read-only.
This is the part of the memory where the actual assembled code gets loaded.

## 2.5 - Strings: String Theory
The library `<string.h>` is part of the C Standard Library and is dedicated to string manipulation.
The C Standard Library is a set of useful code that comes with the compiler.
The library is broken into sections, where each section has a header file.
A header file lists all of the functions that live in a particular section of the library.

Strings can be stored in an array in C:
```c
char tracks[][80] = {
    "This is the first string",
    "This is the second string, an array",
    "Here we have another string." 
}
```

The first square brackets are for the outer array and the second for the inner, thus the strings in this case.

The `strchr()` function find the location of a character inside a string.
The `strcmp()` function compare two strings.
The `strstr()` function finds the location of a string inside another string.
The `strcpy()` function copies one string to another.
The `strlen()` function finds the length of a string.
The `strcat()` function concatenates two strings.

**Bullet Points**:
* You can create an array of arrays with `char strings[...][...]`.
* The first set of brackets is used to access the outer array.
* The second set of brackets is used to access the details of each of the inner arrays.
* The `string.h` file gives you access to a set of string manipulations in the C Standard Library.
* You can create several functions in a C program, but the computer will always  un the `main()` first.




## 3 - Creating Small Tools: Do One Thing and Do It Well
Small tools written in C perform specialized small tasks, such as reading and writing files, or filtering data.
If you want to perform more complex tasks, you can even link several tools together.

In this chapter we'll go over
* command-line options,
* how to manage streams of information,
* redirection.

When you have a big problem to solve, you can break it down into a series of small problems, and then write small tools for each of them.

Tools that read data line by line, process it, and write it out again are called **filters**.
If you have a Unix machine you already have a few filter tools installed.
`head`: This tool displays the first few lines of a file.
`tail`: This filter displays the lines at the end of a file.
`sed`: The stream editor lets you do things like search and replace text.
You can combine filters into filter chains.

`scanf()` and `printf()` don't talk directly to the keyboard and display.
Instead, they use the Standard Input and Standard Output.
The Standard Input and Standard Output are created by the operating system when the program runs.
Thus, the program receives data through the Standard Input and outputs data through the Standard Output.

The operating system controls how data gets into and out of the Standard Input and Output.
If you run a program from the terminal, the operating system will send all of the keystrokes from the keyboard into the Standard Input.
If the operating system reads any data from the Standard Output, by default it will send that data to the display.

You can redirect the Standard Input and Output so that they read and write data somewhere else, such as to and from files.

Instead of entering data at the keyboard, you can use the `<` operator to read the data from a file:
```bash
./geo2json < gpsdata.csv
```
The `<` operator tells the operating system that the Standard Input of the program should be connected to the data *gpsdata.csv* file. 
So you can send the program data directly from a file.

To redirect the Standard Output to a file, you need to use the > operator:
```bash
./geo2json < gpsdata.csv > output.json
```

Redirecting the Standard Input and Output causes our programs to output the error messages to the file as well. 
To cope with this we can use Standard Error.

The Standard Output is the default way of outputting data from a program.
The Standard Error is a second output that was created for sending error messages.

By default the Standard Error is sent to the display.
If we redirect the Standard Input and Output to files, the Standard Error will continue to send data to the display.

`printf()` sends data to the Standard Output.
The `printf()` function is a version of a more general function called `fprintf()`.
The `fprintf()` function allows you to choose where you want to send the text to, either `stdout` or `stderr`.

The `stderr` can be redirected as well by using `2> errors.txt` instead of `>`.

**Bullet Points**:
* The `printf()` function sends data to the Standard Output.
* The Standard Output goes to the display by default.
* You can redirect the Standard Output to a file by using `>` on the command line.
* `scanf()` reads the data from the Standard Input.
* You can redirect the Standard Input to read a file by using `<` on the command line.
* The Standard Error is reserved for outputting error messages.
* You can redirect the Standard Error using `2>`.

One of the great things about small tools is their flexibility.
If you write a program that does onw thing really well, chances are you will be able to use it lots of contexts.

**Tips for Designing Small Tools**:
* They can read data from the Standard Input.
* They can display data on the Standard Output.
* They deal with text data rather than obscure binary formats.
* They each perform one simple task.

To connect two tools we can use the `|` operator that connects the Standard Output of one process to the Standard Input of another process.

When using pipes both programs can run at the same time.
When the first program begins outputting data, the second program can begin.

**Bullet Points**: 
* If you want to perform a different task, consider writing a separate small tool.
* Design tools to work with Standard Input and Standard Output.
* Small tools normally read and write text data. 
* You can connect the Standard Output of one process to the Standard Input of another process using a pipe `|`.

Sometimes you need to create other data streams that your program can use.
This can be done by using the `fopen()` function. 
Each data stream is represented by a pointer to a file and therefore you can used `fopen()` to write to several files.
```c
FILE *in_file = fopen("input.txt", "r");
FILE *out_file = fopen("output.txt", "w");
FILE *append_file = fopen("append.txt", "a");
```
The `FILE` type states that the program should create a data stream.
The `fopen()` function has two parameters: a filename and a mode.
The three values in the second parameter of `fopen()` are:
* `"r"` reads content from the specified file.
* `"w"` writes content to the specified file.
* `"a"` appends content to the specified file.

Once the datastream has been created you can use `fprintf()` to print to it.
To read content from a filestream you can use `fscanf()`.
```c
fprintf(out_file, "Text to write to file");
fscanf(in_file, "%79[^\n]\n", sentence);
```

When done with the data stream, close it with `fclose(in_file)`.
Most of the time the data streams are closed automatically.
But there is a limited number of data streams that can be used within a process.
Most of the time it is 256.
This is why it is a good practice to close the data stream when done using it.

The `main()` function can read the command-line arguments as an array of strings.

```c
int main(int argc, char *argv[])
{
// ... Do stuff ...
}
```

Because C does not have string built-ins, it reads them as an array of character pointers to strings.
Like any array in C, you need some way of knowing how long the arrays is.
That is why the `main()` function has two parameters.
The `argc` value is a count of the number of elements in the array.

Command-line arguments give your program a lot more flexibility, and it is worth thinking about which things you want your users to tweak at runtime.

I will make your program a lot more valuable to them.

The function `getopt()` is used for dealing with command-line options.
Each time you call it, it returns the next option it finds on the command-line.
The `getopt()` function is part of the `<unistd.h>` library.
The `<unistd.h>` header is not part of the standard C library.
Instead, it gives your programs access to some of the POSIX libraries.
POSIX was an attempt to create a common set of functions for use across all popular operating systems.

You can handle the `getopt()` options in a loop:
```c
#include <unistd.h>
...
while ((ch = getopt(argc, argv, "ae:")) != EOF)
    switch(ch) {
    ...
    case 'e':
        engine_count = optarg;
    ...
    }

argc -= optind;
argv += optind;
```
The above example have a few pieces of code that must be explained:
* The `"ae:"` means that the `a` and `e` option is valid.
* The `:` piece of the above command means that the `e` option needs an argument.
* The `case 'e':` part is for reading the required argument passed to the `e` option. 
* The final two lines make sure we skip past the options we read. `optind` stores the number of strings read from the command line to get past the options.

When calling the options on the command line you can also combine them, so instead of `-a -e` you can write `-ae`.
The order of the options doesn't matter due to the setup with `switch()`. 

After processing the arguments, the 0th argument will no longer be the program name.
Therefore, the new `argv` array will be `argv[0]`...

A lot of C programmers spend their time creating small tools, and most of the small tools you see in operating systems like Linux are written in C.
If you are careful in how you design them, and if you make sure that you design tools that **do one thing**, **do that one thing well**, and **integrate well** you're well on course to become a kick-ass C coder.

**Bullet Points**
* There are two versions of the `main()` function - one with command-line arguments and one without.
* Command-line arguements are passed to `main()` as an argument and an array of pointers to the argument strings.
* Command-line options are command-line arguments prefixed with `-`.
* The `getopt()` function from `<unistd.h>` helps you deal with command-line options.
* You define valid options by passing a string to `getopt()` like `ae:`.
* A `:` (colon) following an option in the string means that the option takes an additional argument.
* `getopt()` will record the options argument using the `optarg` variable.
* After you have read all of the options, you should skip past them using the `optind` variable.


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
