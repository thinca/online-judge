#!/usr/bin/zsh

factional(){
	local n f
	let "n = $1"
	let 'f = 1'
	while ((0 < $n));do
		let 'f *= n'
		let 'n--'
	done
	echo $f
}

order(){
	local str count rem fact
	str=$1
	if (($#str == 1)); then
		echo $str
		return
	fi
	rem=$2
	fact=$(factional $(($#str - 1)))

	let "count = rem / fact + 1"
	let 'rem %= fact'

	echo $str[$count]$(order $str[0,$(($count - 1))]$str[$(($count + 1)),$#str] $rem)
}

order 0123456789 999999 # 0 origin
