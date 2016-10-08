local lapis = require("lapis")
local pack
pack = function(...)
  return {
    ...
  }
end
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
        h1("Welcome to Lapis " .. tostring(require("lapis.version")) .. ",")
        return a({
          href = self:url_for("list")
        }, "which I am using to show off my favorite foods!")
      end)
    end,
    [{
      list = "/foods"
    }] = function(self)
      return self:html(function()
        return ul(function()
          for food in pairs(favorite_foods) do
            li(function()
              return a({
                href = self:url_for("food", {
                  name = pack(food:gsub("%s+", "_"))[1]
                })
              }, food)
            end)
          end
        end)
      end)
    end,
    [{
      food = "/foods/:name"
    }] = function(self)
      local name = pack(self.params.name:gsub("_+", " "))[1]
      local food_description = favorite_foods[name]
      if not (food_description) then
        local _ = "Not Found", {
          status = 404
        }
      end
      return self:html(function()
        h1(name)
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
