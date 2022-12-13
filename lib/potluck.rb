 class Potluck
    attr_reader :date, 
                :dishes

    def initialize(date)
        @date = date
        @dishes = [ ]
    end

    def add_dish(mad_dish)
        @dishes << mad_dish
    end

    def get_all_from_category(category)
        dishes.find_all do |dish|
            dish.category == category
        end
    end

    def menu
        {
            appetizers: get_all_from_category(:appetizer).map(&:name).sort,
            entres: get_all_from_category(:entre).map(&:name).sort,
            desserts: get_all_from_category(:dessert).map(&:name).sort
        }
    end
    
    def ratio(category)
       ((get_all_from_category(category).count.to_f) / @dishes.size) * 100
    end
end