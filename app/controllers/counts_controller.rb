class CountsController < ApplicationController
    
    def index
        # query to execute , NEED to be modified to restrict to last 365 days(see example) but issue with current db (sqlite) date functions
        @countsSQL =  "select DATE(created_at) as created, count(id) FROM balloons GROUP BY created;"
        # need something like
        # @countsSQL = "select created_at, count(id) FROM balloons WHERE created_at >= dateadd(day, datediff(day,0,GetDate())- 365,0) GROUP BY created_at;"
        # executing the query
        @countBalloons = ActiveRecord::Base.connection.exec_query(@countsSQL);
       
        # TRY-001 - build XML content by concatenating string values, see ALSO TRY-002 - pass into xml template view and TRY-003 - using XML builder VS string concatenation
        myXMLprefix ="<xml><balloons codeA='101' status_code='ebutuoy'>
        <balloon_counts>"
        myXMLsuffix ="</balloon_counts></balloons></xml>"
        myXMLcontent =""

        @countBalloons.each do | balloon |
            @thisCount = balloon["count(id)"].to_s
            myXMLcontent += "<count date='" + balloon["created"] +"'>"+ @thisCount +"</count>"
        end
        # put it all together
        myXML = myXMLprefix + myXMLcontent + myXMLsuffix
        # sent it the brower as xml
        render xml: myXML
    end 
end
