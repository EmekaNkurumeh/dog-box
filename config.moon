import config from require "lapis.config"

config "dev", ->
	port 8080
	num_workers 1
	code_cache "off"

config "heroku", ->
	port os.getenv "PORT"
	postgressql_url os.getenv "HEROKU_POSTGRESQL_COPPER_URL"
	num_workers 4
	code_cache "on"
