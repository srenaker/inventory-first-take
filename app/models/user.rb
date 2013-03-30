class User
  include MongoMapper::Document
  timestamps!

  key :firstname, String
  key :lastname, String
  key :password, String
  key :collections, String
  key :username, String

end
