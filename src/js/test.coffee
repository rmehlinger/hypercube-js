R = rx.rxt.tags

$(document).ready -> $('body').append R.div {class: 'container'}, [
  R.br()
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
    cellFn: ({sign, m1, m2, m3}) -> sign * m1 * m2 * m3
    cellOptsFn: (__, {sign, m2}) ->
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
    cellFn: ({shape1, shape2}) -> if shape1 == shape2 == 'r' then 'wrinkled' else 'round'
    cellOptsFn: (__, {color1, color2}) -> {
      style: {
        padding: 5,
        backgroundColor: if color1 == color2 == 'g' then '#F5F6CE' else '#CEF6CE'
      }
    }
    tableOpts: {style: {border: '1px solid #333'}}
  }
  R.br()
  R.div {class: 'row'}, R.div {class: 'col-md-12'}, multiDim {
    rowArgs: [
      {name: 'color1', values: ['G', 'g']},
      {name: 'shape1', values: ['R', 'r']}
    ],
    colArgs: [
      {name: 'color2', values: ['G', 'g']},
      {name: 'shape2', values: ['R', 'r']}
    ],
    cellData: [
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'R'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'r'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'R'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'r'}], output: {color: 'green',  shape: 'wrinkled'}}
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'R'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'r'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'R'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'G'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'r'}], output: {color: 'green',  shape: 'wrinkled'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'R'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'r'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'R'}], output: {color: 'green',  shape: 'round'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'G'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'r'}], output: {color: 'green',  shape: 'wrinkled'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'R'}], output: {color: 'yellow', shape: 'round'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'R'},{name: 'shape2', value: 'r'}], output: {color: 'yellow', shape: 'round'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'R'}], output: {color: 'yellow', shape: 'round'}}
      {input: [{name: 'color1', value: 'g'},{name: 'color2', value: 'g'},{name: 'shape1', value: 'r'},{name: 'shape2', value: 'r'}], output: {color: 'yellow', shape: 'wrinkled'}}
    ]
    cellOptsFn: ({color}, __) -> {
      style: {
        padding: 5,
        backgroundColor: if color == 'green' then '#CEF6CE' else '#F5F6CE'
      }
    }
    fmtfn: ({shape}, __) -> R.span {style: fontStyle: if shape == 'wrinkled' then 'italic' else 'normal'}, shape
    tableOpts: {style: {border: '1px solid #333'}}
  }
]