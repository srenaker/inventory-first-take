class User
  include MongoMapper::Document
  timestamps!

  key :firstname, String
  key :lastname, String
  key :password, String
  key :username, String

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :username
  validates_length_of :password, :minimum => 4    
end
