class CommentsController < ApplicationController
    before_action :set_comment, only: [:destroy] 

    #　Post /insects/:insect_id/comments　コメント投稿　OK
    def create
        @comment = Comment.create(comment_params)
        @comment.insects_id = params[:insect_id]
        
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @insect.errors, status: :unprocessable_entit
        end
    end

    # DELETE /insects/:insect_id/comments/:id コメント削除 
    def destroy
        @comment.destroy
    end
    
    private
    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end
