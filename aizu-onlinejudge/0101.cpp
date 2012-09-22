#include <iostream>

int main(int argc, const char *argv[]) {
    int dataNum;
    std::cin >> dataNum;
    std::string data;
    std::getline(std::cin, data);  // skip the first line.
    for (int i = 0; i < dataNum; i++) {
        std::getline(std::cin, data);
        size_t pos = 0;
        while ((pos = data.find("Hoshino", pos)) != std::string::npos) {
            data[pos + 6] = 'a';
        }
        std::cout << data << std::endl;
    }
    return 0;
}
