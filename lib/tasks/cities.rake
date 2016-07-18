require 'csv'
require 'net/http'
require 'net/https' # for ruby 1.8.7
require 'json'

module BRPopulate
  def self.states
    JSON.parse File.read('lib/files/cities.json')
  end

  def self.capital?(city, state)
    city["name"] == state["capital"]
  end

  def self.populate
    states.each do |state|
      state_obj = Information::State.new(:acronym => state["acronym"], :name => state["name"])
      state_obj.save!
      
      
    end
  end
end

namespace :cities do

  desc "Migração de cidades"
  task :migrate => :environment do
    BRPopulate.populate
  end

end