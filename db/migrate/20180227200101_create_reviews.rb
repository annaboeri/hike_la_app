class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :body
      t.string :author
      t.integer :hike_rating
      t.belongs_to :user, foreign_key: true
      t.belongs_to :hike, foreign_key: true

      t.timestamps
    end
  end
end
