class CountsController < ApplicationController
    before_action :index, except: [:create, :update, :destroy]
    
    # generates an svg based on seatmap record values
    def index
        @title = "Preview Seat Map"
        # see rubyOne for original implementation, 
        @seatmap = Seatmap.find(params[:id])
        # seats 
        seats = @seatmap.seats.to_i
        seat_id = 1
        x_base = 100
        x_increment = 25
        # rows 
        rows = @seatmap.rows.to_i
        y_base = 100
        y_increment = 20 
        
        # pre fix
        mySVGprefix ="
        <svg width='580' height='400' xmlns='http://www.w3.org/2000/svg'><g>
            <title>background</title>
            <rect fill='#fff' id='canvas_background' height='402' width='582' y='-1' x='-1'/>
            <g display='none' overflow='visible' y='0' x='0' height='100%' width='100%' id='canvasGrid'>
            <rect fill='url(#gridpattern)' stroke-width='0' y='0' x='0' height='100%' width='100%'/>
            </g>
            </g>
        <g>"
        # label 
         mySVGcontent =" <title>Layer 1</title>
        <text style='cursor: move;' xml:space='preserve' text-anchor='start' font-family='Helvetica, Arial, sans-serif' font-size='24' id='svg_1' y='63.949997' x='221.5' stroke-width='0' stroke='#000' fill='#000000'>#{@seatmap.title}</text>"
        # seats
        mySVGcontentSeats =""
            for i in 1..rows
                y_increment_total = y_base + (i * y_increment)

                # loop to construct seats, using i for setting seat id value and x coordinate seat position
                for j in 1..seats 
                    # mySVGcontentSeats += "<rect id='svg_'"+i.to_s+"height='9' width='17' y='123.949997' x='321.5' stroke-width='1.5' stroke='#000' fill='#fff'/>"
                    x_increment_total = x_base + (j * x_increment)
                    # mySVGcontentSeats += "<rect id='svg_#{j}' height='9' width='17' y='123.949997' x='#{x_increment_total}' stroke-width='1.5' stroke='#000' fill='#fff'/>"
                    mySVGcontentSeats += "<rect id='svg_#{j}' class ='seat' height='9' width='17' y='#{y_increment_total}' x='#{x_increment_total}' stroke-width='1.5' stroke='#000' fill='#fff'/>"
                end
            end

        # close the string 
        mySVGsuffix =" </g></svg>"

        # put it all together
        @mySVG = mySVGprefix + mySVGcontent + mySVGcontentSeats + mySVGsuffix

        # sent it the brower as xml
        # render xml: @mySVG
        # format.html{ redirect_to @counts( content: @mySVG) }
    end 

    # exports the svg image as a file
    def export_svg
        # @mySVG = "some svg content here"
        send_data @mySVG,
          :type => 'text/xml; charset=UTF-8;',
          :disposition => "attachment; filename=#{@seatmap.title}.svg"
    end
end
