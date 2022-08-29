

class PagesStaticController < ApplicationController
skip_before_action :verify_authenticity_token
  
  def home 
    
      vimeo = VimeoMe2::VimeoObject.new('7f1bb222a8f37b6ede76dd59923a11e7') 
    
      vimeo.get('/videos?direction=asc&per_page=4&query=original%20pinoy%20music&page=1')
  
      puts "--------------------this is methods------------------"
      result = JSON.parse(vimeo.instance_variable_get(:@client).to_json)
      result = JSON.parse(result["last_request"].as_json)
        result["data"].each do |items_ar|
          puts ">>>>>>>> keys"
          puts items_ar.keys

          puts ">>>>>>>> keys"
          # puts items_ar.methods
        end
      # puts result["data"].
      # puts result["data"].instance_variables
    
      puts "--------------------this is methods-----------------"
      
        
      @json =  result["data"].to_json

      @res_opm =   result["data"]
     

      vimeo.get('/videos?direction=asc&per_page=4&query=90s%20pop%20music&page=1')
  
      puts "--------------------this is methods------------------"
      result = JSON.parse(vimeo.instance_variable_get(:@client).to_json)
      result = JSON.parse(result["last_request"].as_json)
        result["data"].each do |items_ar|
          puts ">>>>>>>> keys"
          puts items_ar.keys

          puts ">>>>>>>> keys"
          # puts items_ar.methods
        end
      # puts result["data"].
      # puts result["data"].instance_variables
    
      puts "--------------------this is methods-----------------"
      
      

      @res_pop =   result["data"]


    
  end
  def search 
    puts ">>>>///////"
    puts @json
    puts ">>>>///////-----------"
  end 

   def search_post 
     
      vimeo = VimeoMe2::VimeoObject.new('7f1bb222a8f37b6ede76dd59923a11e7') 
      str = params[:searchq]
      str[" "] 
      vimeo.get('/videos?direction=asc&per_page=4&page=1&query='+str)
  
      puts "--------------------this is methods------------------"
      result = JSON.parse(vimeo.instance_variable_get(:@client).to_json)
      result = JSON.parse(result["last_request"].as_json)
        result["data"].each do |items_ar|
          puts ">>>>>>>> keys"
          puts items_ar.keys
          puts @json
          puts ">>>>>>>> keys"
          # puts items_ar.methods
        end
      # puts result["data"].
      # puts result["data"].instance_variables
    
      puts "--------------------this is methods-----------------"
      
        
      @json =  result["data"].to_json

       # =   result["data"]
    
    puts @json
        # render :layout => "sea

        redirect_to :action => "search"
  end  
end
