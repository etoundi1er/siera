class User < Granite::Base
  connection pg
  table users

  column id : Int64, primary: true
  column firstname : String?
  column lastname : String?
  column email : String?
  column age : Int32?
  timestamps
end
