local lapis = require("lapis")
local favorite_foods = {
  ["pizza"] = "Wow pizza is the best! Definitely my favorite",
  ["egg"] = "A classic breakfast, never leave home without",
  ["ice cream"] = "Can't have a food list without a dessert"
}
do
  local _class_0
  local _parent_0 = lapis.Application
  local _base_0 = {
    [{
      index = "/"
    }] = function(self)
      return self:html(function()
        h1("Welcome to Lapis " .. tostring(require("lapis.version")))
        return a({
          href = self:url_for("food_list")
        }, "Favorite Foods!")
      end)
    end,
    [{
      food_list = "/foods"
    }] = function(self)
      return self:html(function()
        return ul(function()
          for food in pairs(favorite_foods) do
            li(function()
              return a({
                href = self:url_for(("food"):gsub("%s+", ""), {
                  name = food:gsub("%s+", "")
                })
              }, food)
            end)
          end
        end)
      end)
    end,
    [{
      food = "/food/:name"
    }] = function(self)
      local food_description = favorite_foods[(self.params.name):gsub("%s+", "")]
      if not (food_description) then
        return "Not Found", {
          status = 404
        }
      end
      return self:html(function()
        h1(self.params.name)
        hr()
        h2("My thoughts on this food")
        return p(food_description)
      end)
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, ...)
      return _class_0.__parent.__init(self, ...)
    end,
    __base = _base_0,
    __name = nil,
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  return _class_0
end
