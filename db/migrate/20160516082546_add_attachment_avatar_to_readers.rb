class AddAttachmentAvatarToReaders < ActiveRecord::Migration
  def self.up
    change_table :readers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :readers, :avatar
  end
end
