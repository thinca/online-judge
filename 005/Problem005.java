import java.math.*;

public class Problem005{
	public static void main(String[] args){
		final BigInteger TWENTY = BigInteger.valueOf(20);
		BigInteger result = BigInteger.ONE;
		for(BigInteger i = BigInteger.valueOf(2); i.compareTo(TWENTY) <= 0;
				i = i.add(BigInteger.ONE)){
			result = lcm(result, i);
		}
		System.out.println(result);
	}

	private static BigInteger lcm(BigInteger a, BigInteger b){
		return a.multiply(b).divide(a.gcd(b));
	}
}
