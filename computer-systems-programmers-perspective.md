# Computer Systems - A Programmer's Perspective
**Authors**: Randal E. Bryant and David R. O'Hallaron

### Preface
Aim is to explain the enduring concepts underlying all computer systems, and to show the concrete ways that these ideas affect the correctness, performance, and utility of application programs.

### Chapter 1 - A Tour of Computing Systems
Files that consist exclusively of ASCII characters are known as text files.
All other files are known as binary files.

The source code for our program `hello.c` is a text file consisting of a sequence of bytes represented by ASCII characters.

All information in a system is represented as a bunch of bits.
The only thing that distinguishes different data objects is the context in which we view2 them.

To run a C program defined by a source file `hello.c` it must be translated to machine-language instructions.
This is done by a compiler driver:
1. Input `hello.c` (text) ->
2. Preprocessor (`cpp`) -> Output `hello.i`, a modified source program (text).
3. Compiler (`cc1`) -> Output `hello.s`, an assembly program (text)
4. Assembler (`as`) -> Output `hello.o`, relocatable object programs (binary).
5. Linker (`ld`), the linker also takes in the `printf.o` object file, used in the `hello.c` program -> output `hello`, an executable object program (binary).

The preprocessor takes the `#include` files and preprends them to the `hello.c` program, ensuring that the header files included are in the source file.
The compiler translates the source program into an assembly-language program, `hello.s`.
The assembler translates the assembly-language program into a relocatable object program, which is binary.
The linker handles the merging of the `hello.o` object file and the `printf.o` object file.

The shell is a command-line interpreter that prints a prompt, waits for you to type a command line, and then performs the command.

#### 1.4.1 - Hardware Organization of a System
**Buses**: Buses are designed to carry fixed-size chunks of bytes knwon as words.
They run all throughout the system.
The number of bytes in a word is a fundamental system parameter.
Most machines have word sizes of either 4 bytes (32 bits) or 8 byted (64 bits).

**I/O Devices**: The systems conection to the external world.
The disk of our computer is also part of the I/O devices.
To transfer information to and from I/O devices an I/O bus is used.
These are connected to the I/O device either by a controller or adapter. 

**Main Memory**: Temporary storage that holds both a program and the data it manipulates while the processor is executing the program.
It consists of a collection of dynamic random access memory (DRAM).

**Processor**: The engine that executes instructions stored in main memory.
The program counter (PC) is a register of word-size. 
At any point in time, the PC points at some machine-language instruction in main memory.
A processor appears to operate according to a very simple instruction execution model, defined by its instruction set architecture.
The processor reads the instruction from memory pointed at by the program counter, interprets the bits in the instruction, performs some simple operation dictated by the instruction, and then updates the program counter to point to the next instruction.
Only a few simple operations exist, revolving around the main memory, the register file, and the arithmetic/logic unit (ALU).
The register file contains a collection of word-size registers.
The ALU computes new data and address values.
Some examples of operations:
* Load: Copy a byte or a word from main memory into a register, overwriting the previous contents of the register.
* Store: Copy a byte or a word from a register to a location in main memory, overwriting the previous contents of that location.
* Operate: Copy the contents of two registers to the ALU, perform an arithmetic operation on the two words, and store the result in a register, overwriting the previous contents of that register.
* Jump: Extract a word from the instruction itself and copy the word into the program counter, overwriting the previos value of the program counter.

We can distinguish the processor's instruction set architecture, describng the effect of each machine-code instruction, from its microarchitecture, describing how the processor is actually implemented.

Much of the time a computer spends while running a program is copying information from place to place.
Because of this, a major goal for system designers is to make these copy operations run as fast as possible.
It is easier to make the processor run faster, than making the memory run faster. 
Thus, the processor-memory gap is becoming larger over the years.

To deal with this caches are used as a temporary staging area for information that the processor is likely to need in the near future:
* *L1 cache* is on the processor and runs nearly as fast as the register.
* *L2 cache* is connected to the processor with a special bus - one or two magnitudes larger than the L1 cache, but around five to ten times slower.
The L1 and L2 caches are implemented with static random access memory (SRAM).

One of the most important lessons in this book is that application programmers who are aware of cache memories can exploit them to improve the performance of their programs by an order of magnitude.

Storage devices in every system is organized as a memory hierarchy.
The top of the hierarchy is the register, which is very small and very fast.
The bottom of the hierarchy is remote secondary storage (web servers etc.) and above that local secondary storage (local disks).

When running the program `hello` it is not accessing the keyboard, display, disk, or main memory directly.
Rather, they relied on the services provided by the operating system.
We can think of the operating system as a layer of software interposed between the application program and the hardware.

The OS has two primary purposes:
1. To protect the hardware from misuse by runaway applications.
2. To provide applications with simple and uniform mechanisms for manipulating complicated and often wildly different low-level hardware devices.
The operating system achieves both goals via the fundamenta abstractions:
* *Processes* abstractions for the processor, main memory, and I/O devices.
* *Virtual memory* abstractions for the main memory and I/O devices.
* *Files* abstractions for I/O devices.

A *process* is the operating system's abstraction for running a program.
A single CPU can appear to execute multiple processes by having the processor switch among them.
The operating system performs this interleaving with a mechanism known as *context switching*. 
The OS keeps track of all the state information that the process needs in order to run - this state is known as the context.
When the OS transfers control from one process to the next, it performs a context switch by saving the context of the current process, restoring the context of the new processes.
A system call is a special function that passes control to the operating system. 
The transition from one process to another is managed by the operating system kernel.
The kernel is the portion of the operating system code that is always resident in memory.
The kernel is not a separate process, it is a collection of code and data structures that the system uses to manage all the processes.

A *file* is a sequence of bytes.
Every I/O device, including disks, keyboards, displays, and even networks 

## Part I - Program Structure and Execution
### Chapter 2 - Representing and Manipulating Information

### Chapter 3 - Machine-Level Representation of Programs

### Chapter 4 - Processor Architecture

### Chapter 5 - Optimizing Program Performance

### Chapter 6 - The Memory Hierarchy

## Part II - Running Programs on a System
### Chapter 7 - Linking

### Chapter 8 - Exceptional Control Flow

### Chapter 9 - Virtual Memory

## Part III - Interaction and Communication between Programs
### Chapter 10 - System-Level I/O

### Chapter 11 - Network Programming

### Chapter 12 - Concurrent Programming

