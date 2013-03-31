class Item
  include MongoMapper::Document
  timestamps!

  key :user_id, String
  key :item_type, String
  key :attr1, String
  key :attr2, String
  key :attr3, String
  key :attr4, String
  key :attr5, String

end
