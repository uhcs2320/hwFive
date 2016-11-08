# hw5, Devhire. Due date: 11/16 11:50 p.m. 

You will create a C++ program that will simulate the selection (via sorting) of candidates to a ficticious Top-6 company that hires CS majors. 
In real companies/organizations, selection of applicants follows a well-thought procedure that is extremely unlikely to mirror the selection method in this programming assignment. 
The fundamental data structure concept to practice is sorting.

## Input

The input is a plain-text file, where each line is terminated with an end-of-line character.
Each line will identify an applicant to join the top-6 ficticious company. 
Lines in the input file that start with the symbol # should be considered comments and therefore skipped.

Each line will have a fixed set of data, separated by the `tab` character (that is, `\t`). 

The data of each line are as follows:

  1. Person name (not repeated in the input file).
  1. GPA, which is a number between 0 to 4, and it may contain at most 1 digit after the decimal point (if any).
  1. CST score (ficticious standardized Computer Science Test with range of 0 to 999). It will not have decimals.
  1. Gender: exactly 1 word (only letters).
  1. Github username: exactly 1 word (letters, dot, and/or numbers). Some times there is nothing listed on this field

Lines that start with the symbol `#` should be considered comments and therefore skipped. There may be empty lines in the input file; such lines should be skipped.

Example 1:

    Olaf   1.0   876   undisclosed   olaf.2016.iced
    Anna   4.0   976   female   anna.2016.arandelle
    Elsa   2.4   476   female   elsa.2016.queen
    Krystoff   1.4   196   male   krystofe.2016.iceguy
    Sven   0.4   16   prefernottoanswer   sven.2016.sven
    instructions   2   2   2

## Program specification

The main program should be called `devhire` and the syntax in which it will be tested is as follows:

`./devhire "input=FILENAME"`

The parameter `input` specifies the name of the input file.

Example of program calls:

`./devhire "input=example.txt"`

The source code will be compiled as follows:

`g++ -std=c++11 -o devhire -I ./ *.cpp`

## Output

Your program will output to the console (such as via `cout`) with the results of selected people to be invited to on-site interviews, if any.
Your program must follow the output format exactly to facilitate automated grading (and to avoid failing test cases due to things such as output of an empty line at the end).

Example of how to output a line:

`cout << personname << endl;`

The output of your program should not have empty lines or comments.

## Assumptions

* Each input file can fit in main memory (not larger than 10kb).

## Requirements

* Must utilize your own implementation of a sorting method (either of: mergesort, quicksort, heapsort). Failure to do so will result in a grade of 2 points (out of 100).
* Place your codes in a folder in your home directory, named: `hw5` (Failure to do so will cause your program to have a zero grade due to inability for doing automated grading).
* Your program should not produce any unexpected output when it is doing intermediate calculations because doing so will interfere with automated grading and some test cases will fail.
* You can not assume a maximum number of lines in the input file.

## Quicksort

Olaf


## Mergesort

Sven


## Heapsort

Frozen


## Slightly related notes

  * Anecdotal comment of 80% of graduating CS majors going to 5 companies [via @paulg](https://twitter.com/paulg/status/740027492665331712)

