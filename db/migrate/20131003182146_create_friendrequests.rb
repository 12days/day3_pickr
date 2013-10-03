class CreateFriendrequests < ActiveRecord::Migration
  def change
    create_table :friendrequests do |t|
      t.integer :inviter_id
      t.integer :invitee_id

      t.timestamps
    end
  end
end
