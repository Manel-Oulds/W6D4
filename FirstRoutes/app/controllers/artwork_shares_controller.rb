class ArtworkSharesController < ApplicationController

    def index
        artwork_shares = ArtworkShare.all
        render json: artwork_shares
    end

    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        if artwork_share.save
            render json: artwork_share
        else
            render json:  artwork_share.errors.full_messages, status: :unprocessible_entity
        end
    end

    def destroy
        artwork_share = ArtworkShare.destroy(params[:id])
        artwork_share.destroy 
        render json: artwork_share
    end

    

    def artwork_share_params
        params.require(:artwork_share).permit(:viewer_id,:artwork_id)
    end
end
