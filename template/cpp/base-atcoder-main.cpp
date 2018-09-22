#include <bits/stdc++.h>
using namespace std;

int main() {
  // {{_cursor_}}
  int n;
  cin >> n;
  vector<string> ss(n, "0");
  vector<int> a(n, 0);
  for (int i = 0; i < n; i++) {
    string s;
    cin >> s;
    s.at(0) = '0';
    a.push_back(stoi(s));
  }
  sort(a.begin(), a.end(), greater<int>());
  int sum = accumulate(a.begin(), a.end(), 0);
  cout << sum << endl;
  return 0;
}
