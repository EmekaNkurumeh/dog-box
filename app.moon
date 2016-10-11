lapis = require "lapis"
import Food from require "static.assets.code.food"

pack = (...) -> {...}
unpack = unpack or table.unpack

favorite_foods = {
  Food name:"pizza", description:"Wow pizza is the best! Definitely my favorite"
  Food name:"egg", description:"A classic breakfast, never leave home without"
  Food name:"ice cream", description:"Can't have a food list without a dessert"
}

class extends lapis.Application
  [index: "/"]: =>
    @html ->
      h1 "Welcome to Lapis #{require "lapis.version"},"
      a href: @url_for("list"), "which I am using to show off my favorite foods!"

  [list: "/foods"]: =>
    @html ->
      ul ->
        for food in *favorite_foods
          li ->
            a href: @url_for("food", {name: pack(food.atr.name\gsub("%s+","_"))[1],indx: _index_0}), food.atr.name
  [food: "/foods/:name"]: =>
    name = pack(@params.name\gsub("_+"," "))[1]
    food = favorite_foods[@params.indx]
    unless food
        "Not Found", status: 404
    @html ->
      h1 name
      hr!
      h2 "My thoughts on this food"
      p food.atr.description
