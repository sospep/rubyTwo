class CountsController < ApplicationController
    
    # require 'builder'

    def index
        # @countsSQL = "select created_at, count(id) FROM balloons WHERE created_at >= dateadd(day, datediff(day,0,GetDate())- 365,0) GROUP BY created_at;"
        @countsSQL = "select DATE(created_at) as created, count(id) FROM balloons GROUP BY created;"

        # @counts = ActiveRecord::Base.connection.execute("countsSQL");
        @counts = ActiveRecord::Base.connection.exec_query(@countsSQL);

    end 
end
