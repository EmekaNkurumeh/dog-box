local typeof
typeof = function(val)
  local xval = type(val) == "table"
  xpcall(function()
    if xval and val.__class.__name then
      xval = val.__class.__name
    else
      xval = type(val)
    end
  end, function()
    xval = "table"
  end)
  return xval
end
local Food
do
  local _class_0
  local _base_0 = { }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, atr)
      self.atr = atr
      assert(typeof(self.atr.name) == "string", "name is not a string")
      return assert(typeof(self.atr.description) == "string", "description is not a string")
    end,
    __base = _base_0,
    __name = "Food"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Food = _class_0
end
return {
  Food = Food
}
