
class ArtworksController < ApplicationController
    def index
        # user = User.all
        # render json: user
        user_id = params[:user_id]
        # debugger
        viewed_artworks = Artwork.artworks_for_user_id(user_id)
        render json: viewed_artworks

        # artworks = Artwork.all
        # render json: artworks

    end

    def create
        # debugger
        artwork = Artwork.new(artwork_params)
        if artwork.save 
            render json: artwork , status: :created
        else
            
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def show
        artwork =  Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork =  Artwork.find(params[:id])
        if artwork.update(artwork_params) 
            
            render json: artwork
        else
            render json:  artwork.errors.full_messages, status: :unprocessible_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy 
        render json: artwork
    end

    private
    def artwork_params 
        params.require(:artwork).permit(:title,:img_url,:artist_id)
    end
end
