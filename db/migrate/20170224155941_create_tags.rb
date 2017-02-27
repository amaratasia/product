# Creating Table Tags for Tagging Products
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end
  end
end
