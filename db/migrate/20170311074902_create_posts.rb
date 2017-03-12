class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :data
		  t.column :post_type, "ENUM('TEXT','SALE')", default: "TEXT"
    	t.belongs_to :user
    	t.belongs_to :group
      t.timestamps null: false
    end
    add_foreign_key :posts, :users
    add_foreign_key :posts, :groups
  end
end
