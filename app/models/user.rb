class User
  include MongoMapper::Document

  key :firstname, String
  key :lastname, String
  key :password, String
  key :collections, String

end
