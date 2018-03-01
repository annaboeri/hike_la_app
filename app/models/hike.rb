class Hike < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  def self.search(search)
    where("name ILIKE ? OR address ILIKE ?", "%#{search}%", "%#{search}%") 
  end



end
