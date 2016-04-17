class AddAttachmentAvatarToSkills < ActiveRecord::Migration
  def self.up
    change_table :skills do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :skills, :avatar
  end
end
