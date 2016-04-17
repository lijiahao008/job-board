class AddSkillIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :skill_id, :integer
  end
end
