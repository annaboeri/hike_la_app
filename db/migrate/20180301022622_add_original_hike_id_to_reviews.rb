class AddOriginalHikeIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :original_hike_id, :bigint
  end
end
