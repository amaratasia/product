# Creating Table Tags for Tagging Products
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :product_id
    end
  end
end
