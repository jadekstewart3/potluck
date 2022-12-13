require './lib/dish'
require './lib/potluck'


RSpec.describe Dish do 
    let(:dish) { Dish.new("Couscous Salad", :appetizer) }

    it "#initialize" do 
        expect(dish).to be_an_instance_of(Dish)
        expect(dish.name).to eq("Couscous Salad")
        expect(dish.category).to eq(:appetizer)
    end
end