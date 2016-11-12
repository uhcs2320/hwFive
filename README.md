# hw5, Devhire. Due date: 11/16 11:50 p.m.

You will create a C++ program that will simulate the selection (via sorting) of candidates to a ficticious Top-6 company that hires CS majors.
In real companies/organizations, selection of applicants follows a well-thought procedure that is extremely unlikely to mirror the selection method in this programming assignment.
The fundamental data structure concept to practice is sorting.

## Input

The input is a plain-text file, where each line is terminated with an end-of-line character.
Each line will identify an applicant to join the top-6 ficticious company.

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
    Sven   0.4   16   prefernottoanswer   
    Madelleine	2.9	397	female
    Frenchy	2.9	397	male
    Lexie	3.1	479	female
    Lex	3.1	479	male
    Batman	3.2	543	male
    Coulson	3.4	765	male
    Director	3.4	765	unspecified
    Robot	3.1	479	prefernottoanswer
    Skye	3.4	765	female
    Supergirl	3.8	876	female
    Superman	3.8	876	male
    Wonderworman	3.2	543	female
    instructions   2   2   2

The last line is a special line that indicates how many people of different gender to select at each iteration. 
Such line will have four items (separated by the `tab` character) where the second, third, and fourth items are non-negative integers (without decimal point).

1. The first item is exactly the string `instructions`
1. The second item is the number of females to select. We will refer to this value as the `nFemales`
1. The third item is the number of males to select. We will refer to this value as the `nMales`
1. The fourth item is the number of people to select for whom their gender does not match exatly the word `male` and does not match exactly the word `female`. We will refer to this value as the `nPreferNotToAnswer`

## Program specification

The main program should be called `devhire` and the syntax in which it will be tested is as follows:

`./devhire "input=FILENAME"`

The parameter `input` specifies the name of the input file.

Example of program calls:

`./devhire "input=example.txt"`

The source code will be compiled as follows:

`g++ -std=c++11 -o devhire -I ./ *.cpp`

## Output

* Your program will output to the console (such as via `cout`) with the results of selected people to be invited to on-site interviews, if any.
* The name of a person should be output at most once.
* Your program must follow the output format exactly to facilitate automated grading (and to avoid failing test cases due to things such as output of an empty line at the end).

Example of how to output each line:

`cout << personname << endl;`

## Score value used for sorting

A score will be calculated for each person depending on their data as follows:

`score = GPA * 10 * (20 - x) + CST - x * 2 + username`

Where 

* `username` has the value `10` when the person had a username; it is zero when such field was empty.
* `x` has value of zero on the first iteration; it increments by 3 at every iteration.

Select candiates to interview (`nFemales`, `nMales`, `nPreferNotToAnswer`) as follows:

1. Calculate scores for everybody on the set of input candidates, and sort them. 
1. Only consider candidate with a score greater than zero.
1. Output the names of the highest scoring `nFemales` females (if available)
1. Output the names of the highest scoring `nMales` males (if available)
1. Output the names of the highest scoring `nPreferNotToAnswer` individuals (if available)
1. Increment `x` by 3
1. If `x` is greater than 20 then the selection of candidates to interview is completed. Otherwise, do another iteration, which means: go back to step 1.

The order matters (because sorting!). If it happens that there are not individuals for a group (such as males), then the program must continue selecting individuals of the other groups. If it happens that there are not individuals for any group, then the selection of individuals is completed.

## Example output for input example

* At the first iteration, Anna (1786) and Supergirl (1636) are selected as top scoring 2 females, followed by Superman (1636) and Coulson(1445) as top scoring males; followed by Director (1445) and Robot (1099) as top scoring individuals not listed as males and not listed as females.
* At the second iteration, Skye (1337) and Wonderwoman (1081) are selected as top scoring 2 females, followed by Batman (1081) and Lex (1000) as top scoring males; followed by Olaf (1050) and Sven (78) as top scoring individuals not listed as males and not listed as females.
* At the third iteration, Lexie (901) and Elsa (810) are selected as top scoring 2 females, followed by Frenchy (791) and Krystoff (390) as top scoring males. No individuals remain in the group having gender not listed as males and not listed as females.
* At the fourth iteration, Madelleine (698) is the only indivdual remaining.

The output would be:

    Anna
    Supergirl
    Superman
    Coulson
    Director
    Robot
    Skye
    Wonderwoman
    Batman
    Lex
    Olaf
    Sven
    Lexie
    Elsa
    Frenchy
    Krystoff
    Madelleine

## Assumptions

* Each input file can fit in main memory (not larger than 10kb).
* You can assume a maximum number of 999 lines in the input file.

## Requirements

* Must utilize your own implementation of a sorting method (either of: mergesort, quicksort, heapsort). Failure to do so will result in a grade of 2 points (out of 100).
* Place your codes in a folder in your home directory, named: `hw5` (Failure to do so will cause your program to have a zero grade due to inability for doing automated grading).
* Your program should not produce any unexpected output when it is doing intermediate calculations because doing so will interfere with automated grading and some test cases will fail.
* Each student needs to indicate which method they will implement. In order to avoid the situation of many students implementing the same method, there can't be more than 2 people difference between two methods. That is, if 12 people selected quicksort, and 10 selected mergesort, then it is not possible for the next student to select quicksort. 
* Students that do not make a selection will get a maximum grade of 90. Selections can be made via Pull Requests, email, or in class.

## Quicksort

1. Benson
1. Rafael
1. Farhan
1. Mike
1. Derreck
1. Chelsea
1. Kim P.
1. Abdul
1. Katelyn

## Mergesort

1. Rogelio
1. Doan
1. Kevin
1. Alexandro
1. Akshay
1. Krishan Desai
1. Xiantian
1. Brandon G

## Heapsort

1. Feng
1. Nancy
1. Junaid
1. Maniroth
1. Joshua
1. Shara
1. Paul
1. Heapsort

## Random related notes

  * It is suggested that test cases be shared (ideally via pull-request).
  * Variations on test cases are easy via the `instructions` by means of changing the values. For example, an easy test case would be that where the three items after `instructions` are 0 0 0
  * Anecdotal comment of 80% of graduating CS majors going to 5 companies [via @paulg](https://twitter.com/paulg/status/740027492665331712)
