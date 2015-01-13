/* vim: set ts=4 sw=4 et: */

(function() {

var data = {};

function loadData() {
    d3.tsv("data/files.txt")
      .get(function(error, rows) { console.log(rows); });
}

loadData();

})();
