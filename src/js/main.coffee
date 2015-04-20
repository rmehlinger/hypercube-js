R = rx.rxt.tags
{bind} = rx

window.multiDim = multiDim = ({rowArgs, colArgs, cellFn, cellOptsFn, tableOpts, cellData, fmtfn}) ->
  tableOpts ?= {}
  cellOptsFn ?= -> {}
  cellData ?= null
  fmtfn ?= _.identity
  cellFn ?= -> ""

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

  rows = cartesianProduct rowArgs.map(({name, values}) -> values.map (value) -> {name, value})...
  cols = cartesianProduct colArgs.map(({name, values}) -> values.map (value) -> {name, value})...

  if cellData
    indexedCellData = _.object cellData.map ({input, output}) ->
      console.log _.pluck _.sortBy(input, 'name'), 'value'
      [
        JSON.stringify(_.pluck _.sortBy(input, 'name'), 'value'), output
      ]
  else
    indexedCellData = {}

  return R.table tableOpts, _.flatten [
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
      row.map ({name, value}, rowIndex) ->
        if rowNum % rowHeights[rowIndex] == 0
          R.th {rowspan: rowHeights[rowIndex]}, value
        else null
      cols.map (col) ->
        argVals = _.sortBy row.concat(col), 'name'
        argString = JSON.stringify _.pluck argVals, 'value'
        argDict = _.object argVals.map ({name, value}) -> [name, value]
        cellVal = if argString of indexedCellData then indexedCellData[argString] else cellFn argDict

        R.td _.extend({}, cellOptsFn(cellVal, argDict)), fmtfn cellVal, argDict
    ]
  ]

cartesianProduct = (lists...) ->
  if lists.length > 1
    r = []
    prod = cartesianProduct(lists[1...]...)
    lists[0].map (item) -> prod.map (product) -> r.push [item].concat product
    return r
  else
    return lists[0].map (item) -> [item]