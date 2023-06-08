class Artwork < ApplicationRecord
    validates :title, :artist_id , :image_url, presence:true
    validates :image_url, uniqueness:true
end
