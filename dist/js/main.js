// Generated by CoffeeScript 1.9.1
(function() {
  var R, bind, cartesianProduct, multiDim,
    slice = [].slice;

  R = rx.rxt.tags;

  bind = rx.bind;

  window.multiDim = multiDim = function(arg) {
    var cellData, cellFn, cellOptsFn, colArgs, colArgsList, colWidths, cols, fmtfn, indexedCellData, numCols, numRows, rowArgs, rowArgsList, rowHeights, rows, tableOpts;
    rowArgs = arg.rowArgs, colArgs = arg.colArgs, cellFn = arg.cellFn, cellOptsFn = arg.cellOptsFn, tableOpts = arg.tableOpts, cellData = arg.cellData, fmtfn = arg.fmtfn;
    if (tableOpts == null) {
      tableOpts = {};
    }
    if (cellOptsFn == null) {
      cellOptsFn = function() {
        return {};
      };
    }
    if (cellData == null) {
      cellData = null;
    }
    if (fmtfn == null) {
      fmtfn = _.identity;
    }
    if (cellFn == null) {
      cellFn = function() {
        return "";
      };
    }
    rowArgsList = rx.array(rowArgs);
    colArgsList = rx.array(colArgs);
    numCols = bind(function() {
      return _.reduce(colArgsList.all(), function(memo, arg1) {
        var values;
        values = arg1.values;
        return memo * values.length;
      }, 1);
    });
    numRows = bind(function() {
      return _.reduce(rowArgsList.all(), function(memo, arg1) {
        var values;
        values = arg1.values;
        return memo * values.length;
      }, 1);
    });
    colWidths = rx.cellToArray(bind(function() {
      var accum;
      accum = numCols.get();
      return colArgsList.all().map(function(arg1) {
        var values;
        values = arg1.values;
        return accum /= values.length;
      });
    }));
    rowHeights = rx.cellToArray(bind(function() {
      var accum;
      accum = numRows.get();
      return rowArgsList.all().map(function(arg1) {
        var values;
        values = arg1.values;
        return accum /= values.length;
      });
    }));
    rows = rx.cellToArray(bind(function() {
      return cartesianProduct.apply(null, rowArgsList.map(function(arg1) {
        var name, values;
        name = arg1.name, values = arg1.values;
        return values.map(function(value) {
          return {
            name: name,
            value: value
          };
        });
      }).all());
    }));
    cols = rx.cellToArray(bind(function() {
      return cartesianProduct.apply(null, colArgsList.map(function(arg1) {
        var name, values;
        name = arg1.name, values = arg1.values;
        return values.map(function(value) {
          return {
            name: name,
            value: value
          };
        });
      }).all());
    }));
    if (cellData) {
      indexedCellData = _.object(cellData.map(function(arg1) {
        var input, output;
        input = arg1.input, output = arg1.output;
        return [JSON.stringify(_.pluck(_.sortBy(input, 'name'), 'value')), output];
      }));
    } else {
      indexedCellData = {};
    }
    return R.table(tableOpts, _.flatten([
      R.thead({}, rx.flatten([
        bind(function() {
          return colArgsList.all().map(function(arg1, ci) {
            var i, name, ref, results, values;
            name = arg1.name, values = arg1.values;
            return R.tr({}, _.flatten([
              R.th({
                colspan: bind(function() {
                  return rowArgsList.length();
                }),
                "class": 'corner-cell'
              }, R.span({
                "class": 'btn-group'
              }, (function() {
                var val;
                val = colArgsList.at(ci);
                return [
                  ci > 0 ? R.button({
                    "class": 'btn btn-default btn-xs',
                    click: function() {
                      colArgsList.removeAt(ci);
                      return colArgsList.insert(val, ci - 1);
                    }
                  }, '^') : void 0, colArgsList.length() > 1 ? R.button({
                    "class": 'btn btn-xs btn-default',
                    click: function() {
                      colArgsList.removeAt(ci);
                      return rowArgsList.push(val);
                    }
                  }, '<') : void 0, ci < colArgsList.length() - 1 ? R.button({
                    "class": 'btn btn-default btn-xs',
                    click: function() {
                      colArgsList.removeAt(ci);
                      return colArgsList.insert(val, ci + 2);
                    }
                  }, 'v') : void 0
                ];
              })())), (function() {
                results = [];
                for (var i = 0, ref = numCols.get() / (colWidths.at(ci) * values.length); 0 <= ref ? i < ref : i > ref; 0 <= ref ? i++ : i--){ results.push(i); }
                return results;
              }).apply(this).map(function() {
                return values.map(function(argVal) {
                  return R.th({
                    colspan: colWidths.at(ci),
                    style: bind(function() {
                      if (ci === colArgsList.length() - 1) {
                        return {
                          borderBottom: 'none'
                        };
                      }
                    })
                  }, argVal);
                });
              })
            ]));
          });
        }), bind(function() {
          var i, j, ref, ref1, results, results1;
          if (rowArgsList.length() > 1) {
            return R.tr({}, rx.flatten([
              (function() {
                results = [];
                for (var i = 0, ref = rowArgsList.length(); 0 <= ref ? i < ref : i > ref; 0 <= ref ? i++ : i--){ results.push(i); }
                return results;
              }).apply(this).map(function(__, ri) {
                return R.th({
                  "class": 'corner-cell'
                }, R.span({
                  "class": 'btn-group'
                }, (function() {
                  var val;
                  val = rowArgsList.at(ri);
                  return [
                    ri > 0 ? R.button({
                      "class": 'btn btn-xs btn-default',
                      click: function() {
                        rowArgsList.removeAt(ri);
                        return rowArgsList.insert(val, ri - 1);
                      }
                    }, '<') : void 0, rowArgsList.length() > 1 ? R.button({
                      "class": 'btn btn-xs btn-default',
                      click: function() {
                        rowArgsList.removeAt(ri);
                        return colArgsList.push(val);
                      }
                    }, '^') : void 0, ri < rowArgsList.length() - 1 ? R.button({
                      "class": 'btn btn-xs btn-default',
                      click: function() {
                        rowArgsList.removeAt(ri);
                        return rowArgsList.insert(val, ri + 2);
                      }
                    }, '>') : void 0
                  ];
                })()));
              }), (function() {
                results1 = [];
                for (var j = 0, ref1 = cols.length(); 0 <= ref1 ? j < ref1 : j > ref1; 0 <= ref1 ? j++ : j--){ results1.push(j); }
                return results1;
              }).apply(this).map(function() {
                return R.th({
                  style: {
                    borderTop: 'none'
                  }
                });
              })
            ]));
          }
        })
      ])), R.tbody({}, rows.map(function(row, rowNum) {
        return R.tr({}, rx.flatten([
          row.map(function(arg1, rowIndex) {
            var name, value;
            name = arg1.name, value = arg1.value;
            if (rowNum % rowHeights.at(rowIndex) === 0) {
              return R.th({
                rowspan: rowHeights.at(rowIndex)
              }, value);
            } else {
              return null;
            }
          }), cols.map(function(col) {
            var argDict, argString, argVals, cellVal;
            argVals = _.sortBy(row.concat(col), 'name');
            argString = JSON.stringify(_.pluck(argVals, 'value'));
            argDict = _.object(argVals.map(function(arg1) {
              var name, value;
              name = arg1.name, value = arg1.value;
              return [name, value];
            }));
            cellVal = argString in indexedCellData ? indexedCellData[argString] : cellFn(argDict);
            return R.td(_.extend({}, cellOptsFn(cellVal, argDict)), fmtfn(cellVal, argDict));
          })
        ]));
      }))
    ]));
  };

  cartesianProduct = function() {
    var lists, prod, r;
    lists = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    if (lists.length > 1) {
      r = [];
      prod = cartesianProduct.apply(null, lists.slice(1));
      lists[0].map(function(item) {
        return prod.map(function(product) {
          return r.push([item].concat(product));
        });
      });
      return r;
    } else {
      return lists[0].map(function(item) {
        return [item];
      });
    }
  };

}).call(this);

//# sourceMappingURL=main.js.map
