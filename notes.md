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
