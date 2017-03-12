class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :data
    	t.belongs_to :user
    	t.belongs_to :post
    	t.integer :parent_id
      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
  end
end
