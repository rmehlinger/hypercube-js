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

# Installation
Hypercube-js is currently available through Bower:

```bower install hypercube-js```

Hypercube-js is dependent on JQuery, Underscore, and Reactive coffee.

# Usage

To build a table, call the `multiDim` function. This function takes as its sole argument an object containing the 
following fields:

* `rowArgs`: a list of argument objects which will define the rows of the table. Each element in the list should have
a `name` field and a `values` field. `name` fields must be unique.
* `colArgs`: a list of argument objects which will define the columns of the table. Each element in the list should have
a `name` field and a `values` field. `name` fields must be unique.
* `cellData`: Used to supply static data to multiDim. Takes a list of objects formatted as follows:
```
{
    input: [
        {name: 'arg1Name', value: 'arg1Value'}
        {name: 'arg2Name', value: 'arg@Value'}
        ...
    ]
    output: <anything>
}
```
* `cellFn`: Used to generate the contents of the table's cells. Takes an object as argument, with its keys being the 
names specified in rowArgs and colArgs. Returns the value of the cell. Defaults to `-> ""`
* `cellOptsFn`: An optional function which is used to specify the attributes for each table cell. Must return an object.
Defaults to `-> {}`. Takes up to two arguments:
    * The value of the cell.
    * The list of input arguments, formatted as per cellFn.
* `fmtfn`: An optional function which formats the contents of the cells. Returns a String or an HTML element. 
Defaults to `_.identity`. Takes up to two arguments:
    * The value of the cell.
    * The list of input arguments, formatted as per cellFn. 
* `tableOpts`: An optional object specifying the attributes--e.g., class, style, handlers--of the table element created.

It returns an HTML table element that can be freely embedded in the DOM. The table can be generated in one of two ways:
using static data, passed in by the `cellData` argument, or by using `cellFn`. If both `cellData` and `cellFn` are
specified, we first attempt to lookup the cell's value in `cellData`, and if it is not present, we fall back on 
`cellFn`.

## Example

The following demonstrates how to create a version of the 4 dimensional Punnett square shown above, using CoffeeScript:

```
$('body').append multiDim {
  rowArgs: [
    {name: 'color1', values: ['G', 'g']},
    {name: 'shape1', values: ['R', 'r']}
  ],
  colArgs: [
    {name: 'color2', values: ['G', 'g']},
    {name: 'shape2', values: ['R', 'r']}
  ],
  cellFn: ({shape1, shape2}) -> if shape1 == shape2 == 'r' then 'Wrinkled' else 'Round'
  cellOptsFn: (__, {color1, color2}) -> {
    style: {
      padding: 5,
      backgroundColor: if color1 == color2 == 'g' then '#F5F6CE' else '#CEF6CE'
    }
  }
  tableOpts: {style: {border: '1px solid #333'}}
}
```

## Reactive Coffee

Hypercube JS is built using [Reactive Coffee](https://yang.github.io/reactive-coffee/), a lightweight reactive 
programming package for Coffeescript.
