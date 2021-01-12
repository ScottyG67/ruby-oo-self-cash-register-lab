require 'pry'
class CashRegister

    attr_accessor :total, :discount
    attr_reader :items
    def initialize(discount=nil)
        @total = 0
        @discount=discount
        @items = []
    end

    def add_item (title, price, quantity =1)
        @total += price*quantity
        @price = price
        @quantity=quantity
        i=0
        while i < quantity
            @items << title
            i+=1
        end
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
        i=0
        while i < @quantity
            @total -=@price
            @items.pop()
            i+=1
        end
    end

end
