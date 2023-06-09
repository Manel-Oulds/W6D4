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

    def self.artworks_for_user_id(user_id)
        # debugger
        # artworks = ArtworkShare.where(viewer_id: user_id).or(Artwork.where(artist_id: user_id))
        #     .joins(:artwork).joins(:viewer)
        #     .select("artworks.title,artworks.img_url,artworks.artist_id")
        #     .distinct
        # artworks
        res =Artwork.left_outer_joins(:artwork_shares).where("viewer_id = #{user_id} OR artist_id = #{user_id}")
        return res
    end
end
