// Generated by CoffeeScript 1.9.1
(function() {
  var R;

  R = rx.rxt.tags;

  $(document).ready(function() {
    return $('body').append(R.div({
      "class": 'container'
    }, [
      R.br(), R.div({
        "class": 'row'
      }, R.div({
        "class": 'col-md-12'
      }, multiDim({
        rowArgs: [
          {
            name: 'm3',
            values: [1, 10, 100]
          }, {
            name: 'sign',
            values: [-1, 1]
          }
        ],
        colArgs: [
          {
            name: 'm1',
            values: [1, 2, 3]
          }, {
            name: 'm2',
            values: [4, 5, 6]
          }
        ],
        tableOpts: {
          "class": 'table'
        },
        cellFn: function(arg) {
          var m1, m2, m3, sign;
          sign = arg.sign, m1 = arg.m1, m2 = arg.m2, m3 = arg.m3;
          return R.span(sign * m1 * m2 * m3);
        },
        cellOptsFn: function(__, arg) {
          var m2, sign;
          sign = arg.sign, m2 = arg.m2;
          return {
            "class": m2 === 5 ? 'info' : sign === -1 ? 'danger' : 'success'
          };
        }
      }))), R.div({
        "class": 'row'
      }, R.div({
        "class": 'col-md-12'
      }, multiDim({
        rowArgs: [
          {
            name: 'color1',
            values: ['G', 'g']
          }, {
            name: 'shape1',
            values: ['R', 'r']
          }
        ],
        colArgs: [
          {
            name: 'color2',
            values: ['G', 'g']
          }, {
            name: 'shape2',
            values: ['R', 'r']
          }
        ],
        cellFn: function(arg) {
          var shape1, shape2;
          shape1 = arg.shape1, shape2 = arg.shape2;
          if ((shape1 === shape2 && shape2 === 'r')) {
            return 'wrinkled';
          } else {
            return 'round';
          }
        },
        cellOptsFn: function(arg) {
          var color1, color2;
          color1 = arg.color1, color2 = arg.color2;
          return {
            style: {
              padding: 5,
              backgroundColor: (color1 === color2 && color2 === 'g') ? '#F5F6CE' : '#CEF6CE'
            }
          };
        },
        tableOpts: {
          style: {
            border: '1px solid #333'
          }
        }
      }))), R.br(), R.div({
        "class": 'row'
      }, R.div({
        "class": 'col-md-12'
      }, multiDim({
        rowArgs: [
          {
            name: 'color1',
            values: ['G', 'g']
          }, {
            name: 'shape1',
            values: ['R', 'r']
          }
        ],
        colArgs: [
          {
            name: 'color2',
            values: ['G', 'g']
          }, {
            name: 'shape2',
            values: ['R', 'r']
          }
        ],
        cellData: [
          {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'green',
              shape: 'wrinkled'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'G'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'green',
              shape: 'wrinkled'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'green',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'G'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'green',
              shape: 'wrinkled'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'yellow',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'R'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'yellow',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'R'
              }
            ],
            output: {
              color: 'yellow',
              shape: 'round'
            }
          }, {
            input: [
              {
                name: 'color1',
                value: 'g'
              }, {
                name: 'color2',
                value: 'g'
              }, {
                name: 'shape1',
                value: 'r'
              }, {
                name: 'shape2',
                value: 'r'
              }
            ],
            output: {
              color: 'yellow',
              shape: 'wrinkled'
            }
          }
        ],
        cellOptsFn: function(arg, __) {
          var color;
          color = arg.color;
          return {
            style: {
              padding: 5,
              backgroundColor: color === 'green' ? '#CEF6CE' : '#F5F6CE'
            }
          };
        },
        fmtfn: function(arg, __) {
          var shape;
          shape = arg.shape;
          return R.span({
            style: {
              fontStyle: shape === 'wrinkled' ? 'italic' : 'normal'
            }
          }, shape);
        },
        tableOpts: {
          style: {
            border: '1px solid #333'
          }
        }
      })))
    ]));
  });

}).call(this);

//# sourceMappingURL=test.js.map
