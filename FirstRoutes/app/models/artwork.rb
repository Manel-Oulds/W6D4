# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :text             not null
#  img_url    :text
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id }
    validates :title, :artist_id , :img_url, presence:true
    validates :img_url, uniqueness:true
    belongs_to :artist, primary_key: :id, class_name: 'User', foreign_key: :artist_id
    has_many :artwork_shares, primary_key: :id, foreign_key: :artwork_id, class_name: :ArtworkShare, dependent: :destroy
    has_many :shared_viewers, through: :artwork_shares, source: :viewer
end
