#include <iostream>
#include <string>

// 0 < n
int digitNumber(int n){
	int d = 0;
	while(n != 0){
		n /= 10;
		d++;
	}
	return d;
}

int pandigital(int n){
	static bool checker[9];
	static int digits[9];
	int count = 0, i;

	for(i = 9; 0 <= --i;){
		checker[i] = false;
	}

	for(i = 1; count < 9; i++){
		int x = n * i;
		int d = digitNumber(x);
		count += d;
		if(10 <= count){
			return 0;
		}
		for(int j = 0; x != 0; j++){
			int digit = x % 10;
			if(digit == 0 || checker[digit - 1]){
				return 0;
			}
			checker[digit - 1] = true;
			digits[count - j - 1] = digit;
			x /= 10;
		}
	}

	int res = 0;
	int d = 1;
	for(i = 9; 0 <= --i; d *= 10){
		res += d * digits[i];
	}
	return res;
}

int main(int argc, char const* argv[]){
	int max = 0;
	for(int i = 1; i < 10000; i++){
		int res = pandigital(i);
		if(max < res){
			max = res;
		}
	}
	std::cout << max;
	return 0;
}
