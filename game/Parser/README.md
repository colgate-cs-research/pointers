
## Install dependencies
```
pip3 install antlr4-tools antlr4-python3-runtime
```

## Test
```
antlr4-parse PsuedoC.g4 statement -tree
```
Enter text on command-line, followed by Ctrl+D (to signal end of input)

## Generate Python source code
```
antlr4 -Dlanguage=Python3 PsuedoC.g4
```
