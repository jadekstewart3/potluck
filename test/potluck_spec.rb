require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do 
    let(:potluck) { potluck = Potluck.new("7-13-18") }
    let(:couscous_salad) { Dish.new("Couscous Salad", :appetizer) }
    let(:cocktail_meatballs) { Dish.new("Cocktail Meatballs", :entre) }
    let(:summer_pizza) { summer_pizza = Dish.new("Summer Pizza", :appetizer) }
    let(:roast_pork) { roast_pork = Dish.new("Roast Pork", :entre) }
    let(:candy_salad) { candy_salad = Dish.new("Candy Salad", :dessert) }
    let(:bean_dip) { bean_dip = Dish.new("Bean Dip", :appetizer) }
    it "exists" do 
        expect(potluck.date).to eq("7-13-18")
        expect(potluck.dishes).to eq([ ])
    end

    it "#add_dish" do 
        potluck.add_dish(couscous_salad)
        potluck.add_dish(cocktail_meatballs)

        expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    end

    it "get_all_from_category" do 
        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        
        expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
        expect(potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
        expect(potluck.get_all_from_category(:appetizer).first.name).to eq("Couscous Salad")
    end

    it "has a menu" do 
        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        potluck.add_dish(bean_dip)

        expected_results = {
                            :appetizers => ["Bean Dip", "Couscous Salad", "Summer Pizza"],
                            :entres => ["Cocktail Meatballs", "Roast Pork"],
                            :desserts => ["Candy Salad"]
                        }

        expect(potluck.menu).to eq(expected_results)
    end

    it "ratio" do
        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)
        potluck.add_dish(bean_dip)

        expect(potluck.ratio(:appetizer)).to eq(50.0)
        
    end
end