R = rx.rxt.tags
{bind} = rx

window.multiDim = multiDim = ({rowArgs, colArgs, cellFn, cellOptsFn, tableOpts, cellData, fmtfn, rearrangeable}) ->
  tableOpts ?= {}
  cellOptsFn ?= -> {}
  cellData ?= null
  fmtfn ?= _.identity
  cellFn ?= -> ""

  rowArgsList = rx.array(rowArgs)
  colArgsList = rx.array(colArgs)

  numCols = bind -> _.reduce(
    colArgsList.all()
    (memo, {values}) -> memo * values.length
    1
  )

  numRows = bind -> _.reduce(
    rowArgsList.all()
    (memo, {values}) -> memo * values.length
    1
  )

  colWidths = rx.cellToArray bind ->
    accum = numCols.get()
    colArgsList.all().map ({values}) -> accum /= values.length

  rowHeights = rx.cellToArray bind ->
    accum = numRows.get()
    rowArgsList.all().map ({values}) -> accum /= values.length

  rows = rx.cellToArray bind -> cartesianProduct(
    rowArgsList.map(({name, values}) -> values.map (value) -> {name, value}).all()...
  )
  cols = rx.cellToArray bind -> cartesianProduct(
    colArgsList.map(({name, values}) -> values.map (value) -> {name, value}).all()...
  )

  if cellData
    indexedCellData = _.object cellData.map ({input, output}) -> [
      JSON.stringify(_.pluck _.sortBy(input, 'name'), 'value'), output
    ]
  else
    indexedCellData = {}

  return R.table tableOpts, _.flatten [
    R.thead {}, rx.flatten [
      bind -> colArgsList.all().map ({name, values}, ci) ->
        #R.tr [0...numCols/(colWidths[ci] * values.length)].map -> R.th {colspan: colWidths[ci] * values.length}, name
        R.tr {}, _.flatten [
          if rearrangeable then R.th {
            colspan: bind -> rowArgsList.length()
            class: 'corner-cell'
          }, R.span {class: 'btn-group'}, do ->
            val = colArgsList.at(ci)
            [
              if colArgsList.length() > 1 then R.button {
                class: 'btn btn-xs btn-default'
                click: ->
                  colArgsList.removeAt(ci)
                  rowArgsList.push(val)
              }, '<'
              if ci > 0 then R.button {
                class: 'btn btn-default btn-xs'
                click: ->
                  colArgsList.removeAt(ci)
                  colArgsList.insert(val, ci - 1)
              }, '^'
              if ci < colArgsList.length() - 1 then R.button {
                class: 'btn btn-default btn-xs'
                click: ->
                  colArgsList.removeAt(ci)
                  colArgsList.insert(val, ci + 2)
              }, 'v'
            ]
          if not rearrangeable and ci == 0 then R.th {
            class: 'corner-cell',
            rowspan: bind -> colArgsList.length()
            colspan: bind -> rowArgsList.length()
          }
          [0...numCols.get()/(colWidths.at(ci) * values.length)].map -> values.map (argVal) ->
            R.th {
              colspan: colWidths.at(ci),
              style: bind -> if ci == colArgsList.length() - 1 then {borderBottom: 'none'}
            }, argVal
        ]
      bind -> if rowArgsList.length() > 1 and rearrangeable then R.tr {}, rx.flatten [
        [0...rowArgsList.length()].map (__, ri) -> R.th {class: 'corner-cell'},
          R.span {class: 'btn-group'}, do ->
            val = rowArgsList.at(ri)
            [
              if rowArgsList.length() > 1 then R.button {
                class: 'btn btn-xs btn-default'
                click: ->
                  rowArgsList.removeAt(ri)
                  colArgsList.push(val)
              }, '^'
              if ri > 0 then R.button {
                class: 'btn btn-xs btn-default'
                click: ->
                  rowArgsList.removeAt(ri)
                  rowArgsList.insert(val, ri - 1)
              }, '<'
              if ri < rowArgsList.length() - 1 then R.button {
                class: 'btn btn-xs btn-default'
                click: ->
                  rowArgsList.removeAt(ri)
                  rowArgsList.insert(val, ri + 2)
              }, '>'
            ]
        [0...cols.length()].map ->
          R.th {style: borderTop: 'none'}
      ]
    ]
    R.tbody {}, rows.map (row, rowNum) ->
      R.tr {}, rx.flatten [
        row.map ({name, value}, rowIndex) ->
          if rowNum % rowHeights.at(rowIndex) == 0
            R.th {rowspan: rowHeights.at(rowIndex)}, value
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