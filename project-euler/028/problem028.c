#include <stdio.h>

int main(int argc, char const* argv[]){
	int init = 1;
	int sum = init;
	int n;

	for(n = 2; n <= 1000; n += 2){
		int next = init + 4 * n;
		sum += (init + n + next) * 2;
		init = next;
	}

	printf("%d", sum);

	return 0;
}
