local config
config = require("lapis.config").config
config("dev", function()
  port(8080)
  num_workers(1)
  return code_cache("off")
end)
return config("heroku", function()
  port(os.getenv("PORT"))
  postgressql_url(os.getenv("HEROKU_POSTGRESQL_COPPER_URL"))
  num_workers(4)
  return code_cache("on")
end)
