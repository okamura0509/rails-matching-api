class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :requester_id, null: false
      t.integer :worker_id, null: false
      t.string :title, null:false
      t.string :body, null:falses
      t.timestamps
    end
  end
end
