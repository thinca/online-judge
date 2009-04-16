use strict;
use warnings;

my $E = 5;

my @digits = map { $_ ** $E }(0..9);

my $max;
{
	my $ceil = 9;
	my $base = $digits[$ceil];
	my $tmpmax = $base;
	while($ceil < $tmpmax){
		$ceil = $ceil * 10 + 9;
		$tmpmax += $base;
	}
	$max = $tmpmax;
}

my $result = 0;

for(my $i = 2; $i < $max; $i++){
	my $sum = 0;
	foreach my $d (split(//, $i)){
		$sum += $digits[$d];
	}
	if($i == $sum){
		$result += $sum;
	}
}
print $result;
