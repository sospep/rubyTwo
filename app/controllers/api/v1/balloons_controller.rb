module Api
    module V1
      class BalloonsController < ApplicationController
        skip_before_action :verify_authenticity_token, :only => [:index, :show, :create, :destroy,:update ]
        # return all balloons, ordered by their created_at date
        def index
            @balloons = Balloon.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Loaded balloons', data:@balloons},status: :ok
        end

        # return a single balloon by it's unique id feild
        def show
            balloon = Balloon.find(params[:id])
            render json: {status: 'SUCCESS', message:'Loaded balloon', data:balloon},status: :ok
        end 

        # add a new balloon record via a json post
        def create
            balloon = Balloon.new(balloon_params)
            
            if balloon.save
                render json: {status: 'SUCCESS', message:'Saved balloon', data:balloon},status: :ok
            else
                render json: {status: 'ERROR', message:'Balloon not saved', data:balloon.errors},status: :unprocessable_entity
            end
        end
        
        # delete a balloon record via the api
        def destroy
            
            balloon = Balloon.find(params[:id])
            balloon.destroy
            render json: {status: 'SUCCESS', message:'Deleted balloon', data:balloon},status: :ok
        end
        
        # update a balloon record via the api endpoint 
        def update
            balloon = Balloon.find(params[:id])           
            if balloon.update_attributes(balloon_params)
                render json: {status: 'SUCCESS', message:'Updated balloon', data:balloon},status: :ok
            else
                render json: {status: 'ERROR', message:'Balloon not updated', data:balloon.errors},status: :unprocessable_entity
            end

        end

        private
        # defining the allowed parameters that can be passed in an Update or New post 
        def balloon_params
            params.permit(:title, :body)
        end
      end
    end
end
   