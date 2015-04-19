R = rx.rxt.tags

$(document).ready -> $('body').append R.div {class: 'container'}, [
  R.div {class: 'row'}, R.div {class: 'col-md-12'}, multiDim {
    rowArgs: [
      {name: 'm3', values: [1, 10, 100]}
      {name: 'sign', values: [-1, 1]}
    ]
    colArgs: [
      {name: 'm1', values: [1,2,3]}
      {name: 'm2', values: [4,5,6]}
    ]
    tableOpts: class: 'table'
    cellFn: ({sign, m1, m2, m3}) -> R.span sign * m1 * m2 * m3
    cellOptsFn: ({sign, m2}) ->
      {class: if m2 == 5 then 'info' else if sign == -1 then 'danger' else 'success'}
  }
  R.div {class: 'row'}, R.div {class: 'col-md-12'}, multiDim {
    rowArgs: [
      {name: 'color1', values: ['G', 'g']},
      {name: 'shape1', values: ['R', 'r']}
    ],
    colArgs: [
      {name: 'color2', values: ['G', 'g']},
      {name: 'shape2', values: ['R', 'r']}
    ],
    cellFn: ({shape1, shape2}) -> if shape1 == shape2 == 'r' then 'Wrinkled' else 'Round'
    cellOptsFn: ({color1, color2}) -> {
      style: {
        padding: 5,
        backgroundColor: if color1 == color2 == 'g' then '#F5F6CE' else '#CEF6CE'
      }
    }
    tableOpts: {style: {border: '1px solid #333'}}
  }
]