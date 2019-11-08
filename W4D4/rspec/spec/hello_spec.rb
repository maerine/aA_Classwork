require 'rspec'
require 'hello'

describe 'my_uniq' do
  it "It returns the unique elements in the order in which they first appeared" do
    expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
  end
end

describe Array do
  describe '#two_sum' do
    it "finds all pairs of positions where the elements at those positions sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "my_transpose" do
  it "convert between the row-oriented and column-oriented representations" do
    expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
  end
end

describe "stock_picker" do
  it "takes in an array of stock prices, and outputs the most profitable pair of days on which to first buy the stock and then sell the stock" do
    expect(stock_picker([33, 22, 55, 43, 90])).to eq([1,4])
  end

  it "should not return the sale date prior to the purchase date" do
    expect(stock_picker([90, 33, 22, 55, 43])).to_not eq([2,0])
  end
end

