# The Linux Command Line
**Author**: William Shotts

## Introduction
A good command line interface is a marvelously expressive way of communicating with a computer in much the same way the written word is for human beings.

About learning to live in the command line interface and learning the UNIX way of thinking.


## PART I - Learning the Shell
### 1 - What is the Shell?
The command line is the shell.
The shell is a program that takes keyboard commands and passes them to the operating system.
Almost all Linux distributions use `bash`.

The `date` command shows the current date.
The `cal`command displays a calendar.
The `df` command shows the free space on our disk drives.
The `free` command shows the free memory.

### 2 - Navigation
`pwd` prints the name of the current working directory.
`cd`changes the directory.
`ls` lists directory contents.

A Unix-like operating system organizes its files in a hierarchical directory structure. 
They are organized in a tree-like pattern of directories.
Unlike Windows, LInux always have only a single file system tree, regardless of the number of storage devices.

Filenames that begin with a period are hidden, the same goes for directories.
Use `ls -a` to view all files, including the hidden.

Linux has no concept of a "file extension" like some other operating systems.
The contents and/or teh purpose of the file is determined by other things.
Although Unix-like operating systems do not use file extensions to determine the contents/purpose of files, many applications do.

### 3 - Exploring the System
`file` determines the filetype.
`less` views the file contents.

Commands are often followd by one or more options that modify their behavior, and further, by one or more arguments, the items upon which the command acts.
Most commands looks like `command -option arguments`.
Most commands use options that consist of a single character preceded by a dash.
Many commands, however, including those from the GNU Project, also support long options, consisting of a word preceded by two dashes.
Many commands also allow multiple short commands to be strung together.

One of the common ideas in the Unix-like operating systems such as Linux is that "everything is a file".

In most Unix-like systems it is possible to have a file rendered by multiple names.

### 4 - Manipulating Files ad Directories

Using wildcards (which is also knwon as globbing) allows us to select filenames based on patterns of characters.
`*` matches any characters.
`?` matches any single character.
`[characters]` matches any character that is a member of the set *characters*.
`[!characters]` matches any character that is not a member of the set *characters*.
`[[:class:]]` matches any character that is a member of the specified class.

Commonly used character classes:
`[:alnum:]` matches any alphanumeric character.
`[:alpha:]` matches any alphabetic character.
`[:digit:]` matches any numeral.
`[:lower:]` matches any lowercase letter.
`[:upper:]` matches any uppercase letter.

`rm` has four options `-i` prompt the user when deleting files, `-r` recursively delete directories, `-f` forces, `-v` is verbose. 

The `ln` command creates links between files:
`ln file link` creates a hard link between file and link.
`ln -s item link` creates a symbolic link where `item` is either a file or directory.

Hard links are the original Unix way of creating links, compared to symbolic links, which are more modern. 
By default, every file has a single hard link that gives the file its name.
When we create a hard link, we create an additional directory entry for a file. 
Hard links have two important limitations:
1. A hard link cannot reference a file outside its own filesystem
   This means a link cannot reference a file that is not on the same disk partition as the link itself.
2. A hard link may not reference a directory.

A hard link is indistinguishable from the file itself.
Unlike a symbolic link, when we list a directory containing a hard link we will see no special indication of the link.
When a hard link is deleted, the link is removed but the contents of the file itself continue to exist (that is, its space is not deallocated) until all links to the file are deleted.

It is important to be aware of hard links because you might encounter them from time to time, but modern practice prefers symbolic links.

Symbolic links were created to overcome the limitations of hard links. 
Symbolic links work by creating a special type of file that containes a text pointer to the referenced file or directory.
In this regard, they operate in much the same way as a Windows shortcut, though of course they predate it.

A file pointed to by a symbolic link, and the symbolic link itself are largely indistinguishable from one another.
If we write something to the symbolic link, the reference file is written to.
However when we delete the symbolic link, only the link is deleted, not the file itself.
If the file is deleted before the symbolic link, the link will continue to exist but will point to nothing. 
In this case the link will by said to be broken.


### 5 - Working with Commands
The `man` displayes is broken into sections:
1. User commands
2. Programming interfaces for kernel system calls.
3. Programming interfaces to the C library.
4. Special files such as device nodes and drivers.
5. File formats. 
6. Games and amusements such as screen savers.
7. Miscellaneous
8. System administration commands.

You can search for a term in a `man` page section by using the command pattern `man section search_term`.

The `apropos` command is used to search the list of man pages for possible matches based on a search term:
`apropos grep` will search the man pages for the term `grep`.

The `whatis` command displays the name and a one-line description of a man page matching a specified keyword.

The `alias name='string'` command is used for creating command aliases:
```bash
alias foo='cd /usr; ls; cd-'
```
To remove an alias use the command `unalias`.

The aliases that are defined on the command line are removed when the shell session is terminated.


### 6 - Redirection
This section will introduce the the following commands:
* `cat` - Concatenate files
* `sort` - Sort lines of text.
* `uniq` - report or omit reported lines.
* `grep` - Print lines matching a pattern.
* `wc` - Print newline, word, and byte counts for each file.
* `head` - Output the first part of a file.
* `tail` - Output the last part of a file.
* `tee` - Read from teh standard input and write to standard output and files.

Output consists of two types:
* The program's result, that is, the data that the program is designed to produce.
* Status and error messages that tell us how the program is getting along.

Keeping with the Unix theme of "everything is a file", programs such as `ls` actually send their results to a special file called standard output and their status messages to another file called standard error.
By default, both standard output and standard error are linked to the screen and not saved into a disk file.

In addition, many programs take input from a facility called standard input, which is, by default attached to the keyboard.

I/O redirection allows us to change where the output goes and where input comes from.

To send the standard output of a command to a file you can use the `>` operator.
Running `ls -a > output.txt` will redirect the output of the `ls -a` command to `output.txt`.
To redirect the standard error of a command to a file you need to specify `2>`.
Thus, running `ls -a 2> error.txt` will redirect any potential errors or status messages to the `error.txt` file.

If we want to append the output of a command to a file we can use the `>>` operator.

If we want to redirect both the standard output and the standard error to the same file we should append `2>&1` to the command, like this: `ls -a > output.txt 2>&1`.
This can also be done by the shorter method `ls -a &> output.txt`.

If we do not want the commands we are entering to output anything we can redirect the standard output or standard error to `/dev/null`.
The `/dev/null` is a system device often referred to as a bit bucket, which accepts input and does nothing with it.
The bit bucket is an ancient Unix concept and because of its universality, it has appeared in many parts of Unix cultuere.

The `cat` command reads one or more files and copies them to standard output.
In the absence of filename arguments, `cat` copies the standard input to standard output.
This behavior can be used to create short text files.

#### Pipelines
The capability of commands to read data from standard input and send to standard output is utilized by a shell feature called pipelines. 
Using the pipe operator `|` the standard output of one command can be piped to the standard input of another.

**Difference between `>` and `|`**:
The redirection operator `>` connects a command with a file, while the pipeline `|` connects the output of one command withthe input of a second command.
The redirection silently creates and overwrites files, so you need to treat it with a lot of respect.

Pipelines are often used to perform complex operations on data.
It is possible to put several commands toegether in a pipeline.
Frequently, the commands used in this way are referred to as *filters*.
Filters take input, change it, and output it again.

The `sort` command takes a list or set of lists and sorts them.
The `uniq` command will either report or omit repeated lines, omit as default report when `-d` is specified.
The `wc` (word count) command is used to display the number of lines, words, and bytes contained in files.

`grep` is a powerful program used to find text patterns within files.
It is used like this `grep pattern [file...]`.

We can create a filter to find all the programs in the system with the pattern "zip" within the name:
```bash
ls /bin /bin/usr | sort | uniq | grep zip
```
There are couple of handy options when using `grep`:
* `-i`, which causes `grep` to ignore case when performing the search (normally searches are case sensitive).
* `-v`, which tells `grep` to only print those lines that do not match the pattern.






### 7 - Seeing the World as the Shell Sees It

### 8 - Advanced Keyboard Tricks

### 9 - Permissions

### 10 - Processes


## PART II - Configuration and the Environment
### 11 - The Environment

### 12 - A Gentle Introduction to Vi

### 13 - Customizing the Prompt

## PART III - Common Tasks and Essential Tools
### 14 - Package Management

### 15 - Storage Media'

### 16 - Networking

### 17 - Searching for Files

### 18 - Archiving and Backup

### 19 - Regular Expressions

### 20 - Text Processing

### 21 - Formatting Output

### 22 - Printing

### 23 - Compiling Programs
