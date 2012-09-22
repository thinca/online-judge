#include <iostream>
#include <algorithm>
#include <functional>

const int DATA_NUM = 10;
const int SHOW_NUM = 3;

int main(int argc, const char *argv[]) {
    int heights[DATA_NUM];
    for (int i = 0; i < DATA_NUM; i++){
        int height;
        std::cin >> height;
        heights[i] = height;
    }

    std::partial_sort(heights, heights + DATA_NUM, heights, std::greater<int>());

    for (int i = 0; i < SHOW_NUM; i++) {
        std::cout << heights[i] << std::endl;
    }

    return 0;
}
