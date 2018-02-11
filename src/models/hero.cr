require "granite_orm/adapter/pg"

class Hero < Granite::ORM::Base
  adapter pg
  table_name heros


  # id : Int64 primary key is created for you
  field name : String
  field favorite : Bool
  timestamps
end
