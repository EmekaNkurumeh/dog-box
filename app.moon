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
      a href: @url_for("list"), "which I am using to show off my favorite foods!"

  [list: "/foods"]: =>
    @html ->
      ul ->
        for food in pairs favorite_foods 
          li ->
            a href: @url_for("food", {name: pack(food\gsub("%s+","_"))[1]}), food
            li ->
              a href: @url_for("food", {name: pack(food\gsub("%s+","_"))[1]}, raw: true), "json"
  [food: "/foods/:name"]: =>
    name = pack(@params.name\gsub("_+"," "))[1]
    food_description = favorite_foods[name]
    unless food_description
        "Not Found", status: 404
    if @params.raw
      @html ->
        h1 name
        hr!
        h2 "My thoughts on this food"
        p food_description
    else
      json: favorite_foods[name]
 