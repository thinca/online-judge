#include <iostream>
#include <cmath>
#include <algorithm>
#include <vector>

int main(int argc, const char *argv[]) {
    int count;
    std::vector<int> nums;
    nums.resize(3, 0);
    std::cin >> count;
    while (0 <= --count) {
        int a, b, c;
        std::cin >> nums[0] >> nums[1] >> nums[2];
        std::sort(nums.begin(), nums.end());
        if (std::pow(nums[0], 2) + std::pow(nums[1], 2) == std::pow(nums[2], 2)) {
            std::cout << "YES" << std::endl;
        } else {
            std::cout << "NO" << std::endl;
        }
    }
    return 0;
}
