#include <iostream>

int main(int argc, const char *argv[]) {
    int data[11][11];

    while (true) {
        int size;
        std::cin >> size;
        if (size == 0) {
            break;
        }

        for (int i = 0; i < size; i++) {
            data[i][size] = 0;
            data[size][i] = 0;
        }
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                std::cin >> data[i][j];
                data[i][size] += data[i][j];
                data[size][j] += data[i][j];
            }
        }
        data[size][size] = 0;
        for (int i = 0; i < size; i++) {
            data[size][size] += data[i][size];
        }

        for (int i = 0; i <= size; i++) {
            for (int j = 0; j <= size; j++) {
                printf("%5d", data[i][j]);
            }
            std::cout << std::endl;
        }
    }
    return 0;
}
