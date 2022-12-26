class AddColumnsToRequest < ActiveRecord::Migration[6.1]
  def change
    add_column :requests , :requester_id, :integer , null: false
    add_column :requests , :worker_id , :integer , null: false
    add_column :requests , :title , :string , null: false
    add_column :requests , :body , :string , null: false
  end
end
