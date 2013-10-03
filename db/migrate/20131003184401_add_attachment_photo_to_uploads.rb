class AddAttachmentPhotoToUploads < ActiveRecord::Migration
  def self.up

    create_table :uploads do |t|
      t.string :title
      t.integer :user_id
    end
    change_table :uploads do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :uploads, :photo
  end
end
