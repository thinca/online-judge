/**
 * @date 2009/03/23 12:55
 */
public class Problem001{
	public static void main(String[] args){
		int sum = 0;
		for(int i = 1000; 0 <= --i;){
			if(i % 3 == 0 || i % 5 == 0){
				sum += i;
			}
		}
		System.out.println(sum);
	}
}
