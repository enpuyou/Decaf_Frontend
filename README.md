
# cs401s2019-lab1

Designed for use with [GitHub Classroom](https://classroom.github.com/), this
repository contains the laboratory 1 assignment in Computer Science 401.

## Introduction

A Compiler for [Decaf](resource/DecafSpecification.pdf), an object-oriented programming
language. It is a strongly-typed language with support for inheritance and
encapsulation. This project is developed for a compiler course.

## Getting Started

To build the scanner, run the command in the `src` folder

	jflex decaf_scanner.flex

To build and run the parser, run the command in the `src` folder

```
	java -jar java-cup-11b.jar decaf_parser.cup
	javac -cp java-cup-11b-runtime.jar:. *.java
	javac -cp .:java-cup-11b.jar Main.java;
	java -cp .:java-cup-11b-runtime.jar Main <sampleprogram>;
```

### Prerequisites

You may need to install [JFlex](http://www.jflex.de/) to run the scanner, the
lexical analyzer generator we are using in this project. More details given
through the link.

You also need to install [CUP](http://www2.cs.tum.edu/projects/cup/install.php),
the parser generator we are using in this project. After installation, unzip the
file in the root directory of the project. More information given through the link.

Due to the incompletion of the whole project, and we are still at the phase of
implementing parser, there might be some errors when running the above commands.
But when runnning the last command
`java -cp .:java-cup-11b-runtime.jar Main <sampleprogram>;`, there should be the
right output of the parser and scanner coming out.

## Updates

When the course instructor provides the new material for the lab, you can type
this command in the main directory for this repository:

```
git remote add download git@github.com:Allegheny-Computer-Science-401-S2019/cs401s2019_lab1.git
```

You should only need to type this command once; typing the command additional
times may yield an error message but will not negatively influence the state of
your repository. Now, you are ready to download the newly uploaded files provided
by the course instructor by typing:

```
git pull download master
```
