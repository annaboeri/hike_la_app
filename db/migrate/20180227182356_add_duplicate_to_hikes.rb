class AddDuplicateToHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :duplicate, :boolean
  end
end
