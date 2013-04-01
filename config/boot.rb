require 'rubygems'

 
if ENV["RAILS_ENV"] == 'production'  
  regex_match = /.*:\/\/(.*):(.*)@(.*):(.*)\//.match(ENV['MONGOLAB_URI'])
  host = regex_match[3]
  port = regex_match[4]
  db_name = regex_match[1]
  pw = regex_match[2]
  

  MongoMapper.connection = Mongo::Connection.new(host, port)
  MongoMapper.database = db_name
  MongoMapper.database.authenticate(db_name, pw)
end  

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
