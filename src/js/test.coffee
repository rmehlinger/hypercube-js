R = rx.rxt.tags

demoData = [
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"denmark"}], "output": "483k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"finland"}], "output": "691.8k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"norway"}],  "output": "339.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"sweden"}],  "output": "530.4k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"denmark"}], "output": "453k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"finland"}], "output": "700.2k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"norway"}],  "output": "329.4k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"sweden"}],  "output": "556.2k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"denmark"}], "output": "510.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"finland"}], "output": "519.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"norway"}],  "output": "462k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"sweden"}],  "output": "1091.4k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"denmark"}], "output": "579.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"finland"}], "output": "564.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"norway"}],  "output": "523.8k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"sweden"}],  "output": "1200k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"denmark"}], "output": "387.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"finland"}], "output": "444.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"norway"}],  "output": "384.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"sweden"}],  "output": "709.2k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"denmark"}], "output": "309.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"finland"}], "output": "335.4k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"norway"}],  "output": "315.6k"},
  {"input":[{"name": "age", "value": "< 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"sweden"}],  "output": "523.2k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"denmark"}], "output": "322k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"finland"}], "output": "461.2k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"norway"}],  "output": "226.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"F"}, {"name": "country", "value":"sweden"}],  "output": "353.6k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"denmark"}], "output": "302k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"finland"}], "output": "466.8k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"norway"}],  "output": "219.6k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Primary"},   {"name": "sex", "value":"M"}, {"name": "country", "value":"sweden"}],  "output": "370.8k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"denmark"}], "output": "340.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"finland"}], "output": "346.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"norway"}],  "output": "308k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"F"}, {"name": "country", "value":"sweden"}],  "output": "727.6k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"denmark"}], "output": "386.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"finland"}], "output": "376.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"norway"}],  "output": "349.2k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Secondary"}, {"name": "sex", "value":"M"}, {"name": "country", "value":"sweden"}],  "output": "800k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"denmark"}], "output": "258.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"finland"}], "output": "296.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"norway"}],  "output": "256.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"F"}, {"name": "country", "value":"sweden"}],  "output": "472.8k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"denmark"}], "output": "206.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"finland"}], "output": "223.6k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"norway"}],  "output": "210.4k"},
  {"input":[{"name": "age", "value": "> 40"}, {"name": "education", "value":"Tertiary"},  {"name": "sex", "value":"M"}, {"name": "country", "value":"sweden"}],  "output": "348.8k"}
]

capitalize = (n) -> "#{n[0].toUpperCase()}#{n[1...]}"

$(document).ready -> $('body').append R.div {class: 'container'}, [
  R.br()
  R.div {class: 'row'}, R.div {class: 'col-md-12'}, multiDim {
    rowArgs: [
      {name: 'sign', values: [-1, 1]}
      {name: 'm3', values: [1, 10, 100]}
    ]
    colArgs: [
      {name: 'm1', values: [1,2,3]}
      {name: 'm2', values: [4,5,6]}
    ]
    tableOpts: class: 'table table-condensed'
    cellFn: ({sign, m1, m2, m3}) -> sign * m1 * m2 * m3
    cellOptsFn: (__, {sign, m2}) ->
      {class: if m2 == 5 then 'info' else if sign == -1 then 'danger' else 'success'}
    rearrangeable: true
  }
  R.div {class: 'row'}, R.div {class: 'col-md-4'}, multiDim {
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
    tableOpts: {class: 'table table-bordered table-condensed'}
  }
  R.div {class: 'row'}, R.div {class: 'col-md-4'}, multiDim {
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
    tableOpts: {class: 'table table-bordered table-condensed'}
  }
  R.div {class: 'row'}, R.div {class: 'col-md-8'}, multiDim {
    rowArgs: [
      {name: 'sex', values: ['M', 'F']}
      {name: 'education', values: ['Primary', 'Secondary', 'Tertiary']},
      {name: 'age', values: ['< 40', '> 40']}
    ],
    colArgs: [
      {name: 'country', values: ['denmark', 'finland', 'norway', 'sweden'], fmtfn: capitalize}
    ],
    cellData: demoData
    cellOptsFn: -> {style: {padding: 5}}
    tableOpts: {class: 'table table-bordered table-condensed'}
  }
  R.div {class: 'row'}, R.div {class: 'col-md-8'}, multiDim {
    cellData: demoData
    rowArgs: [
      {name: 'education', values: ['Primary', 'Secondary', 'Tertiary']},
      {name: 'age', values: ['< 40', '> 40']}
    ],
    colArgs: [
      {name: 'country', values: ['denmark', 'finland', 'norway', 'sweden'], fmtfn: capitalize}
      {name: 'sex', values: ['M', 'F']}
    ],
    cellOptsFn: -> {style: {padding: 5}}
    tableOpts: {class: 'table table-bordered table-condensed'}
  }
  R.div {class: 'row'}, R.div {class: 'col-md-8'}, multiDim {
    rowArgs: [
      {name: 'sex', values: ['M', 'F']}
      {name: 'education', values: ['Primary', 'Secondary', 'Tertiary']},
    ],
    colArgs: [
      {name: 'country', values: ['denmark', 'finland', 'norway', 'sweden'], fmtfn: capitalize}
      {name: 'age', values: ['< 40', '> 40']}
    ],
    cellData: demoData
    cellOptsFn: -> {style: {padding: 5}}
    tableOpts: {class: 'table table-bordered table-condensed'}
  }
]
