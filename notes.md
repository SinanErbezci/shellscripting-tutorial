source: https://www.shellscript.sh/

## Philosophy
- The most important criteria must be a clear, readable layout.
- Second is avoiding unnecessary commands.

## First Script
```bash
# make it executable
chmod 755 first.sh
```
The point to understand here is that the shell parses the arguments BEFORE passing them on to the program being called. 

## Variables

Note that there must be no spaces around the "=" sign: VAR=value works; VAR = value doesn't work

Variables in the Bourne shell do not have to be declared, as they do in languages like C. But if you try to read an undeclared variable, the result is the empty string.

We need to **export** the variable for it to be inherited by another program - including a shell script. 
```bash
MYVAR="hi"
export MYVAR
./second.sh
```

Once the shell script exits, its environment is destroyed. But MYVAR keeps its value of hello within your interactive shell.
In order to receive environment changes back from the script, we must **source** the script - this effectively runs the script within our own interactive shell, instead of spawning another shell to run it.
```bash
# We can source a script via the "." (dot) command:
. ./second.sh
```

## Escape Characters
The backslash character is used to mark these special characters so that they are not interpreted by the shell

```bash
echo "A quote is \", backslah is \\, backtick is \`."
```
```bash
echo "A few spaces are    and dollar is \$. \$X is ${X}."
```

## Test
test is more frequently called as "[". "[" is a symbolic link to test, just to make shell programs more readable.

This means that '[' is actually a program. Test is a simple but powerful comparison utility.

Also, be aware of the syntax - the "if [ ... ]" and the "then" commands must be on different lines. Alternatively, the semicolon ";" can separate them.
```bash
if [ ... ]
then
  echo "sinan"
fi
```
```bash
if [ ... ]; then
  echo "sinan
```

Note that we can use the semicolon (;) to join two lines together

The backslash (\\) serves a similar, but opposite purpose: it tells the shell that this is not the end of the line, but that the following line should be treated as part of the current line.

- "-a -e" -> file exists
- "-f" -> file is a socket
- "-nt" -> file newer than
- "-ot" -> file older than
- "-ef" -> path refers to the smae file
- "-o" -> file is owned by the user running

## Special Variables
- $0 -> basename of the program it was called
- $1..$9 -> first 9 additional parameters
- $@ -> all parameters 1... whatever
- $# -> number of parameters
- $? -> exit value last run command
- $$ -> PID of the currently running shell
- $! -> PID of the last background process
```bash
echo "My name is `basename $0`"
```

## Default Values
By using curly braces and (:-), you can specify default value, if it's not set
```bash
echo "Your name is: ${myname:- `whoami`}"
```
If you want to set to a default value use ":=".

## Using External Programs
The backtick is used to indicate that the enclosed text is to be executed as a command.
```bash
MYNAME=`grep "^${USER}:" /etc/passwd | cut -d: -f5`
echo $MYNAME
```

## Functions
A function may return a value in one of four different ways:

- Change the state of a variable or variables
- Use the exit command to end the shell script
- Use the return command to end the function, and return the supplied value to the calling section of the shell script
- echo output to stdout, which will be caught by the caller just as c=`expr $a + $b` is caught

### Scope of Variables
Basically there's no scoping, only paramters($1, $2)

The $@ parameters are changed within the function to reflect how the function was called. 

