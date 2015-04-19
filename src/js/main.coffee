R = rx.rxt.tags
{bind} = rx

window.multiDim = multiDim = ({rowArgs, colArgs, cellFn, cellOptsFn, tableOpts}) ->
  tableOpts ?= {}
  cellOptsFn ?= -> {}

  numCols = _.reduce(
    colArgs
    (memo, {values}) -> memo * values.length
    1
  )

  numRows = _.reduce(
    rowArgs
    (memo, {values}) -> memo * values.length
    1
  )

  accum = numCols
  colWidths = colArgs.map ({values}) -> accum /= values.length
  accum = numRows
  rowHeights = rowArgs.map ({values}) -> accum /= values.length

  rows = cartesianProduct rowArgs.map(({name, values}) -> values.map (val) -> [name, val])...
  cols = cartesianProduct colArgs.map(({name, values}) -> values.map (val) -> [name, val])...

  R.table tableOpts, _.flatten [
    R.thead {}, _.flatten [
      R.tr R.th {rowspan: colArgs.length * 2 + 1, colspan: rowArgs.length}
      colArgs.map ({name, values}, ci) -> [
        #R.tr [0...numCols/(colWidths[ci] * values.length)].map -> R.th {colspan: colWidths[ci] * values.length}, name
        R.tr _.flatten [0...numCols/(colWidths[ci] * values.length)].map ->
          values.map (argVal) ->
            R.th {colspan: colWidths[ci]}, argVal
      ]
    ]
    R.tbody {}, rows.map (row, rowNum) -> R.tr {}, _.flatten [
      row.map ([name, val], rowIndex) ->
        if rowNum % rowHeights[rowIndex] == 0
          R.th {rowspan: rowHeights[rowIndex]}, val
        else null
      cols.map (col) ->
        argVals = _.object row.concat col
        R.td _.extend({}, cellOptsFn(argVals)), cellFn argVals
    ]
  ]

cartesianProduct = _.memoize (lists...) ->
  if lists.length > 1
    r = []
    prod = cartesianProduct(lists[1...]...)
    lists[0].map (item) -> prod.map (product) -> r.push [item].concat product
    return r
  else
    return lists[0].map (item) -> [item]