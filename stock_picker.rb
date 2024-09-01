def stock_picker prices
  return nil if prices.length < 2

  first_acc = [0, get_sell_day_index_from(prices, 1)]
  prices.length.times.reduce(first_acc) do |acc, buy_index|
    sell_index = get_sell_day_index_from(prices, buy_index)
    return acc if sell_index.nil?
    current_profit = prices[sell_index] -  prices[buy_index]
    max_profit = prices[acc[1]] - prices[acc[0]]
    if current_profit > max_profit
      [buy_index, sell_index]
    else
      acc
    end
  end
end

def get_sell_day_index_from(prices, index)
  sell_index = prices.drop(index + 1).each_with_index.max
  return nil if sell_index.nil?
  sell_index[1] + index + 1
end
