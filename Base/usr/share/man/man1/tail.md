## Name

tail - Print the end of a file

## Synopsis

```**sh
$ tail [-f] [-n number] [file]
```

## Description

`tail` prints the specified `number` (10 by default) of lines at the end of `file`.

## Options

* `-f`, `--follow`: Output data as it is written to the file
* `-r`, `--retry`: Output data as it is written to the file
* `-F` : Same as `--follow --retry`
* `-n number`, `--lines number`: Print the specified number of lines

## Arguments

* `file`: Target file. If unspecified or `-`, defaults to the standard input.

## Examples

Print the last 10 lines of README.md:
```sh
$ tail README.md
```

Print the last 42 lines of todo.txt:
```sh
$ tail -n42 todo.txt
```

Print the last lines as they are written to logs.log:
```sh
$ tail -f logs.log
```

Retry for the file to be first accessible. It will stop once file is opened
```sh
$ tail -r /tmp/file
```

Follow and retry the file
```sh
$ tail -F /tmp/file
```

## See also

* [`head`(1)](help://man/1/head)
* [`cat`(1)](help://man/1/cat)
