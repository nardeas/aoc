// Long input data
//var i = <./4.in>

// Quick and dirty array of arrays conversion
var a = i.split('\n').map((k, i) => {

  var b = k.split('[');
  var c = b[0].split('-').reverse();
  const d = c.shift();
  const e = c.reverse().join('');

  // Order: chars, checksum, sector ID
  return [e, b[1].substr(0, b[1].length-1), parseInt(d)];
});

// Character map
var q = 'abcdefghijklmnopqrstuvwxyz';

// Check checksum validity
var r = a.map((k, i) => {

  // Character occurences
  var l = [];

  // Loop through characters alphabetically and count occurences
  for (var w of q) {
    // Count per character
    l.push(k[0].split(w).length - 1);
  }

  // Checksum as array
  var p = [];

  // Sorting
  l.map((g, j) => {

    // Character occurs in encrypted name
    if (k[0].indexOf(q[j]) !== -1) {

      // Push to beginning if greater than the current first
      if (l[q.indexOf(p[0])] < g) {
        p.unshift(q[j]);
      }

      // Greater than last item, re-sort
      else if (l[q.indexOf(p[p.length - 1])] < g) {

        // Split index to push new character
        var i = -1;

        // Find the first index that is lower than our g
        p.map((o, n) => {
          if (l[q.indexOf(o)] < g && i == -1)
            i = n;
        });

        // Push to original array at correct index
        p = [...p.slice(0, i), q[j], ...p.slice(i, p.length)];
      }

      // Push in alphabetical order
      else {
        p.push(q[j])
      }
    }
  });

  // Return sector ID if checksum is correct, zero otherwise
  return p.join('').substr(0, 5) == k[1] ? k[2] : 0;
});

// Reduce add to get total sum of sector ids
console.log(r.reduce((a, b) => a+b, 0))
