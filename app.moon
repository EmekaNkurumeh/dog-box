lapis = require "lapis"

pack = (...) -> {...} 
favorite_foods = {
  "pizza": "Wow pizza is the best! Definitely my favorite"
  "egg": "A classic breakfast, never leave home without"
  "ice cream": "Can't have a food list without a dessert"
}

class extends lapis.Application
  [index: "/"]: =>
    @html ->
      h1 "Welcome to Lapis #{require "lapis.version"},"
      a href: @url_for("food_list"), "where I show off my favorite Foods!"

  [food_list: "/foods"]: =>
    @html ->
      ul ->
        for food in pairs favorite_foods
          li ->
            a href: @url_for("food", url: pack(food\gsub("%s+", ""))[1], name: food), food

  [food: "/food/:url"]: =>
    food_description = favorite_foods[@params.name]
    unless food_description
      return "Not Found", status: 404

    @html ->
      h1 @params.name
      hr!
      h2 "My thoughts on this food"
      p food_description
