class CountsController < ApplicationController
    
    # require 'builder'

    def index
        # @countsSQL = "select created_at, count(id) FROM balloons WHERE created_at >= dateadd(day, datediff(day,0,GetDate())- 365,0) GROUP BY created_at;"
        @countsSQL = "select DATE(created_at) as created, count(id) FROM balloons GROUP BY created;"

        # @counts = ActiveRecord::Base.connection.execute("countsSQL");
        @countBalloons = ActiveRecord::Base.connection.exec_query(@countsSQL);

=begin
        # myXML ="test string 2" // PASS
        myXML ="<xml><balloons codeA='101' status_code='ebutuoy'>
        <balloon_counts>
            <count> 4 </count>
        </balloon_counts>
        </balloons>
        </xml>"

        # File.open("logg.txt", "w") { |f| f.write "#{Time.now} - User logged in\n" }
        # File.write("myXml.txt", myXML)
        # puts myXML

        # render plain: myXML // PASS

        # render xml: myXML // PASS -v-001 hard coded string


        # TRY-00n
        myXML ="<xml><balloons codeA='101' status_code='ebutuoy'>
        <balloon_counts>
          <% @countBalloons.each do | balloon | %>
            <count><%= balloon %></count>
          <%end%>
        </balloon_counts>
        </balloons>
        </xml>"
        render xml: myXML
=end
        # TRY-00n - concatenate string values
        myXMLprefix ="<xml><balloons codeA='101' status_code='ebutuoy'>
        <balloon_counts>"
        myXMLsuffix ="</balloon_counts></balloons></xml>"
        myXMLcontent =""
        
        @countBalloons.each do | balloon |
            # PASS works
            # myXMLcontent += "<count>" +  balloon["created"] + "</count>"

            # modify to get actual desired output format
            # myXMLcontent += "<count date='" + balloon["created"] +"'">" +  balloon["count(id)"] + "</count>" // FAIL 
            # PASS
            # myXMLcontent += "<count date='" + balloon["created"] +"'> 3 </count>"
            # PASS - final  
            @thisCount = balloon["count(id)"].to_s
            myXMLcontent += "<count date='" + balloon["created"] +"'>"+ @thisCount  +"</count>"
            # FAIL 
            # myXMLcontent += "<count date='" + balloon["created"] +"'>"+ @balloon["count(id)"].to_s  +"</count>" 

        end
        myXML = myXMLprefix + myXMLcontent + myXMLsuffix
        render xml: myXML

        # TRY next = use /view template VS string builder method 
        # render xml:@countBalloons
        # render template: 'views/counts/index.xml.erb'
    end 
end
