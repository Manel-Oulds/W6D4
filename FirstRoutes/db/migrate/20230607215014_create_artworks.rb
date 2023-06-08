class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.text :title, null:false
      t.text :img_url, unique:true
      t.bigint :artist_id, null:false, index:true
      t.timestamps
    end
  end
end
