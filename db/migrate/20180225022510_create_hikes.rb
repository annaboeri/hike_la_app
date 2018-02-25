class CreateHikes < ActiveRecord::Migration[5.1]
  def change
    create_table :hikes do |t|
      t.string :name
      t.string :address
      t.string :photo
      t.float :distance
      t.integer :difficulty
      t.boolean :dog_friendly
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
