coins = [1, 2, 5, 10, 20, 50, 100, 200]

def count_combination(coins, money)
  return 1 if money == 0
  return 0 if coins.empty?
  if coins.size == 1
    raise 'Can not make a combination.' if money % coins[0] != 0
    return 1
  end
  coins = coins.clone
  count = 0
  until coins.empty?
    rem = money - coins.last
    count += count_combination(coins, rem) if 0 <= rem
    coins.pop
  end
  return count
end

count_combination(coins, 200).display
