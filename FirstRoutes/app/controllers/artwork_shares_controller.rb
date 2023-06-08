class ArtworkSharesController < ApplicationController

    def create
        artwork_share = ArtworkShare.new(artwork_params)
        if artwork_share.save
            render json: artwork_share
        else
            render json:  artwork_share.errors.full_messages, status: :unprocessible_entity
        end
    end

    def destroy
        artwork_share = ArtworkShare.destroy(params[:id])
        artwork_share.destroy 
        redirect_to(artwork_shares_url)


    end


    def artwork_share_params
        params.require[:artwork_shares].permit[:viewer_id,:artwork_id]
    end
end
