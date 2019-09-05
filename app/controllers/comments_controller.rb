class CommentsController < ApplicationController
    http_basic_authenticate_with name: "don", password: "don", only:[:destroy]

    def create
        @balloon = Balloon.find(params[:balloon_id])
        @comment = @balloon.comments.create(comment_params)
        redirect_to balloons_path
    end

    # deletes a comment
    def destroy
        @balloon = Balloon.find(params[:balloon_id])
        @comment  = @balloon.comments.find(params[:id])
        @comment.destroy
        # gotcha here with post referring VS post
        redirect_to balloon_path(@balloon)
        # redirect_to '../views/balloons/show/'+balloon.id
    end

    private def comment_params
        params.require(:comment).permit(:username,:body)
    end
end
