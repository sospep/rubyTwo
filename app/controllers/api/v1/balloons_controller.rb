module Api
    module V1
      class BalloonsController < ApplicationController
        skip_before_action :verify_authenticity_token, :only => [:index, :show, :create, :destroy,:update ]
        # return all balloons, ordered by their created_at date
        def index
            @balloons = Balloon.order('created_at DESC');
            render json: {status: 'SUCCESS', message:'Loaded balloons', data:@balloons},status: :ok
        end

        # return a single balloon by it's unique id feild, includes error check for non existant balloon ids
        def show
            begin
                balloon = Balloon.find(params[:id])
            rescue ActiveRecord::RecordNotFound => e
                balloon = nil
            end
            if balloon == nil
                render json: {status: 'ERROR', message:'That Balloon doesnt exist', data:"@Balloon.errors"},status: :unprocessable_entity
            else 
                render json: {status: 'SUCCESS', message:'Loaded balloon', data:balloon},status: :ok
            end
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
        
        # delete a balloon record via the api, includes error check for non existant balloon ids
        def destroy
            begin
                balloon = Balloon.find(params[:id])
            rescue ActiveRecord::RecordNotFound => e
                balloon = nil
            end
            if balloon == nil
                render json: {status: 'ERROR', message:'Balloon doesnt exist', data:"No Balloon with this id Exists"},status: :ok
            else 
                balloon.destroy
                render json: {status: 'SUCCESS', message:'Deleted balloon', data:balloon},status: :ok
            end
        end
        
        # update a balloon record via the api endpoint, includes error check for non existant balloon ids
        def update
            begin
                balloon = Balloon.find(params[:id])
            rescue ActiveRecord::RecordNotFound => e
                balloon = nil
            end
            
            if balloon != nil && balloon.update_attributes(balloon_params) 
                render json: {status: 'SUCCESS', message:'Updated balloon', data:balloon},status: :ok
            else
                render json: {status: 'ERROR', message:'Balloon not updated', data:"balloon.error - balloon id doesnt exist"},status: :unprocessable_entity
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
   