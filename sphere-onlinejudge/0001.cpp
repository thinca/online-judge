#include <iostream>

int main(int argc, const char *argv[]) {
	int num;
	std::cin >> num;
	while (num != 42) {
		std::cout << num << std::endl;
		std::cin >> num;
	}
	return 0;
}
