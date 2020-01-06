#include <iostream>
#include <numeric>
#include <string>
#include <vector>

int main() {
  int n;
  std::cin >> n;
  std::vector<int> a(n);
  for (int i = 0; i < n; i++) {
    std::string s;
    std::cin >> s;
    a.at(i) = stoi(s);
    s.at(0) = '0';
    a.push_back(stoi(s));
  }
  sort(a.begin(), a.end(), std::greater<int>());
  int sum = accumulate(a.begin(), a.end(), 0);
  std::cout << "sum: " << sum << std::endl;
  for (const auto &e : a) {
    std::cout << e << std::endl;
  }
  return 0;
}
