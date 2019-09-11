module Api
    module V1
      class CommentsController < ApplicationController
        skip_before_action :verify_authenticity_token, :only => [:index, :show, :create, :destroy,:update ]
        # return all comments, ordered by their created_at date
        def index
            @comments = Comment.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Loaded comments', data:@comments},status: :ok
        end

        # return a single comment by it's unique id feild
        def show
            comment = Comment.find(params[:id])
            render json: {status: 'SUCCESS', message:'Loaded comment', data:comment},status: :ok
        end 

        # add a new comment record via a json post
        def create
            comment = Comment.new(comment_params)
            
            if comment.save
                render json: {status: 'SUCCESS', message:'Saved comment', data:comment},status: :ok
            else
                render json: {status: 'ERROR', message:'Comment not saved', data:comment.errors},status: :unprocessable_entity
            end
        end
        
        # delete a comment record via the api
        def destroy
            comment = Comment.find(params[:id])
            comment.destroy
            render json: {status: 'SUCCESS', message:'Deleted comment', data:comment},status: :ok
        end
        
        # update a comment record via the api endpoint 
        def update
            comment = Comment.find(params[:id])           
            if comment.update_attributes(comment_params)
                render json: {status: 'SUCCESS', message:'Updated comment', data:comment},status: :ok
            else
                render json: {status: 'ERROR', message:'Comment not updated', data:comment.errors},status: :unprocessable_entity
            end

        end

        private
        # defining the allowed parameters that can be passed in an Update or New post 
        def comment_params
            params.permit(:username, :body)
        end
      end
    end
end
   