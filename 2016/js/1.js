// Input array
//var a = <./1.in>.split(", ");

// Initial coords
var p = [0, 0]

// Start direction n; n=1, e=2, s=3, w=4
var d = 1;

// Find the final destination point
a.map((k, i) => {

  // Coord delta
  var y = parseInt(k.substr(1));

  // Direction change
  d += k.startsWith("R") ? 1 : -1;

  // Ensure we roll between 1-4
  d = (d <= 0 ? 4 : d);
  d = (d >= 5 ? 1 : d);

  // Calculate x coord delta
  p[0] += (d % 2 === 0 ? (d === 2 ? y : -y) : 0);

  // Calculate y coord delta
  p[1] += (d % 2 === 1 ? (d === 3 ? y : -y) : 0);
});

// Difference from origo is final point |x|+|y|
console.log(Math.abs(p[0]) + Math.abs(p[1]));
