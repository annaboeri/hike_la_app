class AddOriginalHikeIdToHikes < ActiveRecord::Migration[5.1]
  def change
    add_column :hikes, :original_hike_id, :bigint
  end
end
