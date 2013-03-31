class Collection
  include MongoMapper::Document
  timestamps!

  key :user_id, String
  key :item_type, String
  key :attr1, String
  key :attr2, String
  key :attr3, String
  key :attr4, String
  key :attr5, String
  
  validates_presence_of :user_id, :message => 'You must be logged in to make a new collection.'
  validates_presence_of :item_type
  validates_presence_of :attr1, :message => 'Your collection must have at least one attribute.'
  
  
end
