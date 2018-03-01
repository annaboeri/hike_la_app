class RemoveOriginalHikeIdFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :original_hike_id, :bigint
  end
end
