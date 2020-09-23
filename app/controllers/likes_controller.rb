class LikesController < ApplicationController
    before_action :set_insect, only: [:index]

    def index
        #likes = @insect.likes.count
        #render json: likes
    end

    #POST   /insects/:insect_id/comments
    def create
        Like.create(insect_id: params[:insect_id])
    end

    private
    def set_insect
        @insect = Insect.find(params[:id])
    end

end
