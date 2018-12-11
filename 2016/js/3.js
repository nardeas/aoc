// Long input data
//var i = <./3.in>

// Result (triangle count)
var r = i.split('\n')

// Map to ones if triangle and zeroes otherwise
.map((k, i) => {

  // Filter empty indices and convert to integers
  var s = k.split(' ')
    .filter((v) => Boolean(v))
    .map((l) => {
      return parseInt(l)
    });

  // Check that the sum of the length of any two sides
  // is greater than the third
  return Number(
    s[0] + s[1] > s[2] &&
    s[1] + s[2] > s[0] &&
    s[2] + s[0] > s[1]
  );
})

// Reduce add
.reduce((x, y) => {
  return x + y
}, 0);

// Output result
console.log(r);
