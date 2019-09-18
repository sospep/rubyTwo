class SeatmapsController < ApplicationController
    
    def index
        @title = "index - Seat Maps"
        @content = "This page displays a listing of all the seatmaps that are available"
        @seatmaps = Seatmap.all
    end

    def show
        @title = "Show Seat Map"
        @content = "This page displays the detail view for the selected Seat Map"
        @seatmap = Seatmap.find(params[:id])
    end
    def new 
        @title = "New Seat Map"
        @content = "This page enables you to add a new Seat Map"
        @seatmap = Seatmap.new
    end

    def create
        @seatmap = Seatmap.new(seatmap_params)

        # validation - redirect if form saves successfully, esle redraw the new form
        if @seatmap.save()
            redirect_to @seatmap
        else
            render 'new'
        end
    end
    
    private def seatmap_params
        params.require(:seatmap).permit(:title,:description,:rows, :seats )
    end

    def edit 
        @title = "Edit Seat Map"
        @content = "This page enables you to Edit the selected Seat Map"
        @seatmap = Seatmap.find(params[:id])
    end

    def update
        @seatmap = Seatmap.find(params[:id])
        if @seatmap.update(seatmap_params)
            redirect_to @seatmap
        else
            render 'edit'
        end
    end

    def destroy
        @seatmap = Seatmap.find(params[:id])
        @seatmap.destroy
        redirect_to seatmaps_path
    end 

end
