class LikesController < ApplicationController

    def index
        likes = Like.where(insect_id: params[:insect_id])
        render json: likes
    end

    #POST   /insects/:insect_id/comments
    def create
        Like.create(insect_id: params[:insect_id])
    end


end
