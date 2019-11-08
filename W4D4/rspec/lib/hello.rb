require "byebug"

def my_uniq(array)
  uniq = []
  array.each {|ele| uniq << ele if !uniq.include?(ele) }
  uniq
end

class Array
  def two_sum
    sums = []
    self.each_with_index do |el_1, i_1|
      self.each_with_index do |el_2, i_2|
        sums << [i_1, i_2] if i_2 > i_1 && (el_1 + el_2 == 0)
      end
    end
    sums
  end
end

def my_transpose(array)
  transposed = []
  array.each_with_index do |el_1, i_1|
    row = []
    array.each_with_index do |el_2, i_2|
      row << array[i_2][i_1]
    end
    transposed << row
  end
  transposed
end

def stock_picker(prices)
  ###iterate twice
  ###two variables
  ###most profit is difference between the two prices
  profitable = nil
  best_days = Array.new(2)
  
  prices.each_with_index do |purchase, buy_day|
    prices.each_with_index do |sell, sell_day|
      # debugger
      
      profit = sell - purchase 

      if sell_day > buy_day 
        if profitable == nil || profit > profitable
          profitable = profit
          best_days[0] = buy_day
          best_days[1] = sell_day
        end
      end
    end
  end
  best_days
end

# puts stock_picker([33, 22, 55, 43, 90])