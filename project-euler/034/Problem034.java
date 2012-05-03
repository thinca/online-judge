public class Problem034{
	private static int[] factionals;
	public static void main(String[] args){
		factionals = new int[10];
		factionals[0] = 1;
		for(int i = 1; i < 10; i++){
			factionals[i] = factionals[i - 1] * i;
		}
		int f9 = factionals[factionals.length - 1];

		int maxDigit = digitNumber(f9);
		while(maxDigit < digitNumber(f9 * maxDigit)){
			maxDigit++;
		}

		int max = 1;
		while(0 <= --maxDigit){
			max *= 10;
		}
		
		int sum = 0;
		for(int i = 3; i < max; i++){
			if(sumDigitsInFactional(i) == i){
				sum += i;
			}
		}
		System.out.println(sum);
	}

	public static int digitNumber(int n){
		return Integer.toString(n).length();
	}

	public static int sumDigitsInFactional(int n){
		if(n == 0){
			return factionals[0];
		}
		int sum = 0;
		while(n != 0){
			sum += factionals[n % 10];
			n /= 10;
		}
		return sum;
	}
}
