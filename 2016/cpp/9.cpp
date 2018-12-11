#include <iostream>
#include <regex>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

// Simple string split with first occurence returning vector of 2 strings
vector<string> split(string str, string delim) {
  vector<string> output;
  size_t n = str.find(delim);
  output.push_back(str.substr(0, n));
  if (n != string::npos) {
    output.push_back(str.substr(n + delim.size(), str.length()));
  }
  return output;
}

// Overload * operator for strings
string operator*(const string &s, int n) {
  string str;
  for(int i=0; i<n; i++)
    str+=s;
  return str;
}

int main() {

  // Algo:
  // (1) Find first occurence of decompression marker (AxB)
  // (2) Split by marker
  // (3) Take of s[1][0:A]
  // (4) Decompress s[1][0:A] * B
  // (5) s[0] + decomp(s[1][0:A])
  // (6) continue with s = s[1][A:]

  // Test string & decompressed output
  string puzzle_input = "";
  string decomp = "";

  // Base regex to find decompression markers & placeholder for base match
  regex r("\\(([0-9]*)x([0-9]*)\\)");
  smatch m;

  // Placeholder for split strings
  vector<string> v;

  // Match first decompression command
  regex_search(puzzle_input, m, r);

  while (m.length() > 0) {

    // Split by found decompression marker
    v = split(puzzle_input, m[0].str());

    int n_chars = stoi(m[1]);
    int n_times = stoi(m[2]);

    // Repeat substring block n_times and append
    decomp += v[0] + (v[1].substr(0, n_chars) * n_times);

    // Assign rest of the string to puzzle_input
    puzzle_input = v[1].substr(n_chars, v[1].length());

    // Search for new decompression markers in the rest of the string
    regex_search(puzzle_input, m, r);
  }

  // Decompressed + unmatched remainder
  decomp += puzzle_input;

  // Output decompressed length
  cout << decomp.length() << endl;
}
