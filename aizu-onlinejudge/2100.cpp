#include <iostream>

void processSet() {
    int blockNum, maxDown = 0, maxUp = 0;
    std::cin >> blockNum;

    int currentHeight;
    std::cin >> currentHeight;  // first block
    for (int i = 1; i < blockNum; i++) {
        int height;
        std::cin >> height;

        if (height < currentHeight) {
            int down = currentHeight - height;
            if (maxDown < down) {
                maxDown = down;
            }
        } else if (currentHeight < height) {
            int up = height - currentHeight;
            if (maxUp < up) {
                maxUp = up;
            }
        }

        currentHeight = height;
    }

    std::cout << maxUp << " " << maxDown << std::endl;
}

int main(int argc, const char *argv[]) {
    int setNum;
    std::cin >> setNum;

    for (int i = 0; i < setNum; i++) {
        processSet();
    }

    return 0;
}
