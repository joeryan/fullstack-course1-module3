require 'httparty'

class Recipe
  include HTTParty
  base_uri "http://food2fork.com/api"
  default_params sort: 'r', key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for term
    get("/search", query: {query: term})["recipes"]
  end
end
