class AddColumnsToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :from_user_id , :integer , null: false
    add_column :likes, :to_user_id ,:integer, null:false
  end
end
