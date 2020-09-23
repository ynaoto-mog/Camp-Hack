class CommentsController < ApplicationController
    before_action :set_comment, only: [:destroy] 
    before_action :set_insect, only: [:index]
    def index
        comments = @insect.comment
        render json: comment
    end

    #　Post /insects/:insect_id/comments　コメント投稿　OK
    def create
        @comment = Comment.create(comment_params)
        @comment.insect_id = params[:insect_id]
        
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors, status: :unprocessable_entit
        end
    end

    # DELETE /insects/:insect_id/comments/:id コメント削除 
    def destroy
        @comment.destroy
    end
    
    private
    def set_insect
        @insect = Insect.find(params[:id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end
