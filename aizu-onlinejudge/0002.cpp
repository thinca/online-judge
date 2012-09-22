#include <iostream>
#include <sstream>
#include <string>

int digits(int n) {
    if (n == 0) {
        return 1;
    }
    int d = 0;
    while (n != 0) {
        n /= 10;
        d++;
    }
    return d;
}

int main(int argc, const char *argv[]) {
    std::string line;
    while (std::getline(std::cin, line)) {
        std::istringstream stream(line);
        int a, b;
        stream >> a >> b;
        std::cout << digits(a + b) << std::endl;
    }
    return 0;
}
