class Dish
    attr_reader :name, :category
    def initialize(label, symbol)
        @name = label
        @category = symbol
    end
end