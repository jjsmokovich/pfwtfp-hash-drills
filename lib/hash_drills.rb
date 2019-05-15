def shopping_list
{
    :sweets => ["soda", "candy", "potato chips"],
    :protein => {
        :meat => ["chicken", "fish", "steak"],
        :other => ["eggs", "nuts","beans"]
    },
    :dairy => ["milk", "yogurt", "cheese"],
    :fruits => ["bananas", "oranges", "apples", "grapes"],
    :vegetables => ["cabbage", "broccoli", "tomatoes", "carrots"],
    :grains => ["crackers", "rice", "bread", "pasta", "cereal"]
}
end

def vegetarian_ingredients
    veggie_list = shopping_list
    veggie_list[:protein][:other].shift
    veggie_list[:protein].delete(:meat)
    veggie_list
end

def ketogenic_ingredients
    keto = shopping_list.select{|k, v| 
    [:protein, :vegetables, :dairy].include? k
    }
    keto[:dairy] = ["cheese"]
    keto
end

def mediterranean_ingredients
    medi_categories = [:protein, :dairy, :vegetables, :fruits, :grains]
    med = shopping_list.select {|k, v| 
        medi_categories.include? k
    }
    med[:protein][:meat].pop
    med[:protein][:other] = ["nuts"]
    med[:dairy].shift
    med
end

def vegan_ingredients 
    shopping_list = vegetarian_ingredients
    shopping_list.delete(:dairy)
    shopping_list
end

def remove_allergens(shopping_list) 
    shopping_list[:protein][:other].delete("nuts")
    shopping_list
end