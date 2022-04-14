# Writing an Interpreter in Go
**Author**: Thorsten Ball

## Introduction
The interpreter is what makes seemingly random characters into something meaningful.

A tree-waling interpreter is the middle ground between simple interpreters that evaluate input right away and complex interpreters that optimizes code and uses advanced parsing and evaluation techniques. 
The tree-walking interpreter parse the source code, build an abstract syntax tree (AST) out of it and then evaluate this tree.

We are going to implement a tree-walking interpreter for the self-made programming language Monkey.
Expressed as a list of features, Monkey has the following:
* C-like syntax.
* Variable bindings.
* Integers and booleans.
* Arithmatic expressions.
* Built-in functions.
* First-class and higher-order functions.
* Closures.
* A string data structure.
* An array data structure.
* A hash data structure.

The interpreter will implement all of the above.
It will tokenize and parse Monkey source code in a REPL, building up an internal representation of the code called abstract syntax tree and then evaluate this tree.
It will have a few major parts:
* The Lexer
* The Parser
* The Abstract Syntax Tree (AST)
* The Internal Object System
* The Evaluator

## 1 - Lexing
### 1.1 - Lexical Analysis
This is the part of the interpreter that does the tokenizatio.
Tokens are small, easily categorizable data structures that are fed to the parser.
The parser then turns the tokens into an AST.

In the Monkey language of the book, whitespace are only used as a separator between tokens.
Lexer input example: `let x = 5;`
Lexer output example (roughly):
```
[
    LET,
    IDENTIFIER("x"),
    EQUAL_SIGN,
    INTEGER(5),
    PLUS_SIGN,
    INTEGER(5),
    SEMICOLON
]
```
The lexer will also have the original source code representation and line number attached. 
Thus, the lexer output for `let` in the source code might be `[LET, let, 1]`.

### 1.2 - Defining our Tokens
If the parser should be able to parse (understand) its input, we need to define it in a rigorous way.
Therefore, the first thing we need to do is to determine what types of tokens our lexer should be outputting.

Other than identifiers/ literals, operators, delimiters, and keywords we need two special types of tokens.
The `ILLEGAL` token (for errors) and the `EOF` token (for end of file).

### 1.3 - The Lexer
The goal of this section is to write our own lexer.
Taking source code as input and output the tokens that represent the source code.
It will go through its input and output the next token it recognizes.
It does not need to buffer or save tokens, since there will only be one method called `NextToken()`, which will output the next token.



## 2 - Parsing

## 3 - Evaluation

## 4 - Extending the Interpreter


## Resources
