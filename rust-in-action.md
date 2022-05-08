# Rust In Action
Yet the differences are sufficiently different to minimize issues that 
**Author**: T. S. McNamara

### Chapter 1 - Introducing Rust
**Covers**:
* Highlighting features of the language and community.
* Exposing you to Rust's syntax.
* Introducing the goals of the project.
* Discussing where Rust might be useful and when to avoid it.
* Building your first Rust program.
* Explaining how Rust compares to object-oriented and wider languages.

Many of Rust's features are drawn from two programming sub-fields: systems programming and functional programming.
* From systems programming, Rust draws the notion of control and a willingness to strip back abstraction when required.
* From functional programming, Rust provides efficient implementations of higher-order programming, an impressive type system, pattern matching and first class support for generics.

The language's syntax is similar to programming languages from the C heritage.

Rust's distinguising feature - as a programming language - is its ability to analyse prevent and prevent invalid data access in your system at compile time.
It guarantees that your program is memory safe without imposing any run time costs.
The three goals of Rust: safety, productivity, and control.

With all of the advantages of Rust there are some downsides:
* Compiling is slower than peer languages.
* Rust is strict - it is very difficult to be lazy when programming with it.
* Rust is large. 

#### 1.7 - Where does Rust fit best?
**Data Processing**:
Rust is extremely good at text processing and data wrangling.
World fastest regex engine.
The type system and memory control provide you with the ability to create high-throughput data pipelines with low and stable memory footprint.
Small filter programs can be easily embedded into a larger framework via Apache Storm and Apache Kafka.

**Extending an Application**:
Rust is well suited for extending programs written in a dynamic language.

**Operating in Resource-constrained Environments**:
Rust can play an important role here by adding a layer of safety without imposing runtime costs.

**Applications**: 
There is nothing inherent in Rust's design that prevents it from being deployed to develop user-facing software.
Servo, the web browser engine that acted as an incubator for Rust's early development, is a user-facing application.

All Rust crates has the same structure.
In their base directory, a file called `Cargo.toml` describes the project's metadata, such as the project's name, its version and dependencies.
Source code appears in the `src/` directory.
Rust source code files use the `.rs` extension.
Rust has built-in support for Unicode.

When printing in Rust we write `println!`.
The exclamation mark signals the use of a macro.
Macros can be thought of as a sort of fancy function for now.
They offer the ability to avoid boilerplate code.
In the case of `println!`, there is a bunch of type detection going on under the hood so that arbritary data types can be printed to the screen.

Rust has no garbage collector slowing the system, but it still offers the convenience of one.
Rust is statically typed.
That means, the behavior of all data is defined in advance of the program being run and that behavior is well specified.
Yet, Rust has a very smart compiler.
That compiler doesn't always need to be told about the data types that it encounters.

#### 1.11 - Summary
This chapter you learned that:
* Many companies have successfully built large software projects in Rust.
* Software written in Rust can be compiled to the PC, the browser, the server, as well as mobile and IoT devices.
* The language is well loved by software developers. It has repeatedly won Stack Overflow's "most loved programming language" title.
* Rust allows you to experiment without fear. It provides correctness guarantees that other tools are unable to provide without imposing runtime costs.
* There are three main command line tools to learn:
    * `cargo`, which manages a whole crate.
    * `rustup`, which manages Rust installations.
    * `rustc`, which manages compilation of Rust source code.
* Rust projects are not immune from all bugs.

## Part I - Rust Language Distinctives
### Chapter 2 - Language Foundations
**Covers**:
* Getting to grips with Rust syntax.
* Learning the fundamental types and data structures.
* Building command line utilities.
* Compiling programs.

By the end of this program you will be able to create command line utilities and should be able to get the gist of most Rust programs.
We'll be working through most of the language syntax but deferring much of the detail of why things are how they are for later in the book.
We'll be building `grep-lite` for patterns within text, printing lines that match the pattern.

The `let` keyword is used to declare variable bindings.
Variables are immutable by default.

`println!` is a macro.
Macros are function-like, but return code rather than a value.
In the case of printing, every data type has its own way of being converted to a string.
`println!` takes care of figuring out the exact methods to call on its arguments.

The Rust compiler `rustc` can be invoked to create working executables from source code.

The `array_name.iter()` method returns an iterator over `array_name` that provides references to enabling access to the individual elements.

The Rust `match` keyword is analogous to other languages' `switch` keyword, and can provide an alternative to `if` statements that is easier to read and more robust.
You can match multiple conditions separated by `|`.

#### 2.5 - Getting Stuff Done With Functions
Rust functions require that you specify your parameters' types and the function's return type.

Reading through other's Rust code, you may encounter rune-like definitions like what happens:
`add_with_lifetimes<'a, 'b>(i: &'a i32, j: &'b i32) -> i32`
`<'a, 'b>` introduces the lifetimes `'a` and `'b` within the scope of `add_with_lifetimes`.
`&'a i32` reads as "reference to an i32 with lifetime a".

In general terms, this extra information is providing more specific information to the Rust compiler about data that lives outside the function.
Functions that use references - denoted by ampersands preceding the types - have data that exists outside of their scope.

Objects that live outside fo a function are checked to make sure that accessing them is valid throughout that function.
That is, Rust checks to make sure that all input data will live at least as long as the function that needs it.

Underpinning Rust's safety checks is a lifetime system that tends to be able to work unaided.
Usually, lifetime parameters do not need to be provided.
Within the Rust community, this is known as lifetime elision.
When they do they appear in angle brackets.

Another speical case of function syntax appears when programmers write Rust functions to handle many possible input types.
Here is a function signature that can be called by many input types, as long as they are all the same:
`fn add(i: T, j: T) -> T`.
Capital letters indicate a generic type.

Generic types can have some constraints placed on them.
In the above example, we should ask the compiler to check that our input types support addition.
To do that, programmers add trait bounds within angle brackets, before the parameter list: 
`fn add<T: Add<Output = T>>(i: T, j: T) -> T`

Trait bounds refer to traits.
A trait is a language feature that is analogous to an interface or protocol in other domains. 

Priniciples to assist function signatures:
* Terms in lower case `(i, j)` denote variables.
* Single upper case letters `(T)` denote generic type variables.
* Terms beginning with upper case `(Add)` are traits and specific types, such as `String`.
* Labels `('a)` denote lifetime parameters.

#### 2.6 - Creating `grep-lite` v1


### Chapter 3 - Compound Data Types

### Chapter 4 - Lifetimes, Ownership, and Borrowing

## Part II - Demystifying Systems Programming
### Chapter 5 - Data in Depth

### Chapter 6 - Memory

### Chapter 7 - Files and Storage

### Chapter 8 - Networking

### Chapter 9 - Time and Time Keeping

### Chapter 10 - Threads, Processes & Containers

### Chapter 11 - Kernel

### Chapter 12 - Signals, Interrupts, and Exceptions

