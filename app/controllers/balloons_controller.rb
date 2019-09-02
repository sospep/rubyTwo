class BalloonsController < ApplicationController
    http_basic_authenticate_with :name=>"don", :password=>"don", except:[:index, :show]
    
    def index
        @title = "index - Balloons"
        @content = "This page displays a listing of all the balloons in our collection"
        @balloons = Balloon.all
    end
    
    def show
        @title = "Show Balloon"
        @content = "This page displays the detail view for the selected balloon"
        @balloon = Balloon.find(params[:id])
    end

    def new 
        @title = "New Balloon"
        @content = "This page enables you to add a new balloon"
        @balloon = Balloon.new
    end
    
    def create
        # render plain: params[:post].inspect
        @balloon = Balloon.new(balloon_params)

        # validation - redirect if form saves successfully, esle redraw the new form
        if @balloon.save()
            redirect_to @balloon
        else
            render 'new'
        end
    end
    
    private def balloon_params
        params.require(:balloon).permit(:title,:body)
    end
    
    def edit 
        @title = "Edit Balloon"
        @content = "This page displays you to Edit the selected balloon"
        @balloon = Balloon.find(params[:id])
    end

    def update
        @balloon = Balloon.find(params[:id])
        if @balloon.update(balloon_params)
            redirect_to @balloon
        else
            render 'edit'
        end
    end

    def destroy
        @balloon = Balloon.find(params[:id])
        @balloon.destroy
        redirect_to balloons_path
    end 


end
