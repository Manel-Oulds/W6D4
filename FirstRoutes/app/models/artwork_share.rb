# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  viewer_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true
    validates :viewer_id, presence: true, uniqueness: { scope: :artwork_id }
    belongs_to :viewer, primary_key: :id, foreign_key: :viewer_id, class_name: :User
    belongs_to :artwork, primary_key: :id, foreign_key: :artwork_id, class_name: :Artwork
end


