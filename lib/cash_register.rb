require 'pry'
class CashRegister
    
    def initialize(discount=nil)
        @total = 0
        @discount=discount
        @items = []
    end

    attr_accessor :total, :discount
    attr_reader :items

    def add_item (item, price, quantity =1)
        @total += price*quantity
        @price = price
        @quantity=quantity
        quantity.times {@items << item}
    end

    def apply_discount
        if @discount
            @total = @total - @total*@discount/100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        @quantity.times do
            @total -=@price
            @items.pop()
        end
    end

end
