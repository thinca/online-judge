import java.math.*;

public class Problem003{
	public static void main(String[] args){
		BigInteger e = new BigInteger("600851475143");
		BigInteger n = BigInteger.valueOf(2);
		while(n.compareTo(e) < 0){
			if(e.remainder(n).equals(BigInteger.ZERO)){
				e = e.divide(n);
			}else{
				n = n.add(BigInteger.ONE);
			}
		}
		System.out.println(e);
	}
}
