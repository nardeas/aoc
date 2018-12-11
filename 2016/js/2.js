// Input moveset as array
//var a = <./2.in>.split("\n")

// Keypad matrix
var m = [[1, 2, 3],[4, 5, 6],[7, 8, 9]];

// Result array
var r = []

// Current position
var x = 1;
var y = 1;

// Loop through movesets
a.map((s, i) => {

  // Loop through moves
  s.split('').map((k, j) => {
    if ('RL'.indexOf(k) !== -1)
      x = Math.min(2, Math.max(0, (k == 'R' ? x+1 : x-1)));
    else
      y = Math.min(2, Math.max(0, (k == 'D' ? y+1 : y-1)));
  });

  // Push result
  r.push(m[y][x]);
});

// Output code
console.log(r.join(''));
