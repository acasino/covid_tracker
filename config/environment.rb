require "net/http"
require "open-uri"
require "json"
require "pry"
require "colorize"
require "tty-prompt"

require_relative "../lib/modules/covidtracker"
require_relative "../lib/cli"
require_relative "../lib/coviddata"
require_relative "../lib/api"
require_relative "../lib/metadata"
require_relative "../lib/gif"