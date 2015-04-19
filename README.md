# Introduction

Hypercube JS is a package to facilitate building multi-dimensional tables in Javascript, by automatically computing
the layout necessary to embed a higher dimensional table in the DOM. This project is still in the very early stages of
development, and likely to change substantially.

So, what is a multi-dimensional table?

Multi-dimensional tables are an extension of two dimensional tables. A two-dimensional table has only two
variables, with a finite set of values for each. The values for one of these variables is used to define the columns,
while those of the other is used to define the rows. The value of an individual cell in the table can then be thought of
as the result of calling a 2-ary function, using its row and column position as inputs. A classic example of a 
two-dimensional table would be the Punnett square, which map a gene's genotypes to its phenotypes, such as here, 
showing whether a pea is round or wrinkled:

|     |  R  |  r  |
| --- | --- | --- |
|  R  | Round | Round |
|  r  | Round | Wrinkled |
 
 
Multi-dimensional tables work along a similar principle, however, they allow the user to embed more than two variables
into the table. It does so by using multiple levels of headers, with each level representing the value of a parameter
given the values of all the parameters above it.

This can alternatively be thought of as building a table of tables. A simple example is a Punnett square comparing
two genes, e.g., whether a pea is green or yellow, and whether it is round or wrinkled:

|      |      |       |       |       |       |
| ---: | ---: | :---: | :---: | :---: | :---: |
|      |      | **G** | **G** | **g** | **g** |
|      |      | **R** | **r** | **R** | **r** |
|**G** |**R** |  Round, Green  |  Round, Green  |  Round, Green  |  Round, Green  |
|**G** |**r** |  Round, Green  |  Wrinkled, Green  |  Round, Green  |  Wrinkled, Green  |
|**g** |**R** |  Round, Green  |  Round, Green  |  Round, Yellow  |  Round, Yellow  |
|**g** |**r** |  Round, Green  |  Wrinkled, Green  |  Round, Yellow  |  Wrinkled, Yellow  |

Unfortunately, even two dimensional tables are difficult enough to work with in HTML, embedded as they are in a one dimensional tree structure. Attempting to layout higher dimensional tables is a tedious and difficult task. Hypercube-js simplifies that task, and does the hard work for you.

# Usage

To build a table, call the `multiDim` function. This function takes as its sole argument an object containing the 
following fields:

* `rowArgs`: a list of argument objects which will define the rows of the table. Each element in the list should have
a `name` field and a `values` field. `name` fields must be unique.
* `colArgs`: a list of argument objects which will define the columns of the table. Each element in the list should have
a `name` field and a `values` field. `name` fields must be unique.
* `tableOpts`: An object specifying the attributes--e.g., class, style, handlers--of the table element created
* `cellFn`: Used to generate the contents of the table's cells. Takes an object as argument, with its keys being the 
names specified in rowArgs and colArgs. May return a String, an HTML element, or a Reactive Coffee bind (see below).
* `cellOptsFn`: A function which takes the same input as cellFn and is used to specify the attributes for each table 
cell.

It returns an HTML table element that can be freely embedded in the DOM. 

# Reactive Coffee

Hypercube JS is built using [Reactive Coffee](https://yang.github.io/reactive-coffee/), a lightweight reactive 
programming package for Coffeescript.
