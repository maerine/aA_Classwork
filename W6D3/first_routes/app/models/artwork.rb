class Artwork < ApplicationRecord
  validates :image_url, presence: true 
  validates :title, presence: true, uniqueness: {scope: :artist_id} 

  belongs_to :artist, 
    primary_key: :id, 
    foreign_key: :artist_id, 
    class_name: :User 

  has_many :shares, 
    primary_key: :id, 
    foreign_key: :artwork_id, 
    class_name: :ArtworkShare 

  has_many :shared_viewers, 
    through: :shares, 
    source: :viewer 
end
