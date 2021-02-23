require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(ed = 0)
    @items = []
    @total = 0
    @discount = ed
    #binding.pry
  end

  def add_item(title, price, qty = 1)

    @items.push({"title" => title, "price" => price, "qty" => qty})
    #binding.pry
    @total += price*qty;
  end

  def apply_discount
    if(@discount == 0)
      return "There is no discount to apply."
    else
      @total *= (1-(@discount/100.to_f)).to_f

    end
    return "After the discount, the total comes to $#{@total.to_i}."
  end

  def items
    result = []
    @items.each do
      |item|
      num = item["qty"]
      while(num > 0)
        result.push(item["title"])
        num -= 1
      end
    end
    return result
  end

  def void_last_transaction
    @items.pop
    @total = 0

    @items.each do
      |item|
      @total += item["price"]*item["qty"]
    end

  end

end
