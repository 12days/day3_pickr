class DropTables < ActiveRecord::Migration
  def change
    drop_table :friendrequests
    drop_table :userfriends
  end
end
