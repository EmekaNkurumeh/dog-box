typeof = (val) ->
  xval = type(val) == "table"
  xpcall ->
    if xval and val.__class.__name
      xval = val.__class.__name
    else
      xval = type val,
    -> xval = "table"
  xval
class Food
  new: (@atr) =>
    assert typeof(@atr.name) == "string", "name is not a string"
    assert typeof(@atr.description) == "string", "description is not a string"

{:Food}
