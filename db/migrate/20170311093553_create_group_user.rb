class CreateGroupUser < ActiveRecord::Migration
  def change
    create_join_table :groups, :users
  end
end
