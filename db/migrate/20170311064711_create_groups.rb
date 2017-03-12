class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :name
    	t.column :group_type, "ENUM('SECRET','OPEN','PRIVATE')", default: "SECRET"
		t.timestamps null: false
    end
  end
end
