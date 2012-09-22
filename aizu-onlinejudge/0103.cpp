#include <iostream>

int main(int argc, const char *argv[]) {
    int num;

    std::cin >> num;
    for (int i = 0; i < num; i++) {
        int score = 0;
        int out = 0;
        int base = 0;
        while (out < 3) {
            std::string event;
            std::cin >> event;

            if (event == "HIT") {
                if (base == 3) {
                    score++;
                } else {
                    base++;
                }
            } else if (event == "HOMERUN") {
                score += base + 1;
                base = 0;
            } else if (event == "OUT") {
                out++;
            }
        }
        std::cout << score << std::endl;
    }
    return 0;
}
