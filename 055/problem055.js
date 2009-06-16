function reverse(n){
	return Number(String(n).split('').reverse().join(''));
}

function isPalindromic(n){
	return n == reverse(n);
}

function isLychrel(n, r){
	if(r <= 0){
		return true;
	}
	var next = n + reverse(n);
	return !isPalindromic(next) && isLychrel(next, r - 1);
}

var count = 0;
for(var i = 0; i < 10000; i++){
	if(isLychrel(i, 50)){
		count++;
	}
}
print(count);
