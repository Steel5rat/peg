include ApplicationHelper
class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
	if logged?
		@images = Image.all

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render :json => @images }
		end
    else
		unloggedRedirect
	end
  end

  # GET /images/1
  # GET /images/1.json
  def show
	if logged?
		@image = Image.find(params[:id])

		respond_to do |format|
		  format.html # show.html.erb
		  format.json { render :json => @image }
		end
	else
		unloggedRedirect
	end
  end

  # GET /images/new
  # GET /images/new.json
  def new
	if logged?
		@image = Image.create(:news_id => params[:news_id])

		respond_to do |format|
		  format.html # new.html.erb
		  format.json { render :json => @image }
		end
	else
		unloggedRedirect
	end
  end

  # GET /images/1/edit
  def edit
	if logged?
		@image = Image.find(params[:id])
    else
		unloggedRedirect
	end
  end

  # POST /images
  # POST /images.json
  def create 
#    @image = Image.new(params[:image])
	
	#news_id = params[:news_id] + params[:image]
	if logged?
		@image = Image.new( params[:image])
		respond_to do |format|
		  if @image.save
			format.html { redirect_to @image, :notice => 'Image was successfully created.' }
			format.json { render :json => @image, :status => :created, :location => @image }
		  else
			format.html { render :action => "new" }
			format.json { render :json => @image.errors, :status => :unprocessable_entity }
		  end
		end
    else
		unloggedRedirect
	end		
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
	if logged?  
		@image = Image.find(params[:id])

		respond_to do |format|
		  if @image.update_attributes(params[:image])
			format.html { redirect_to @image, :notice => 'Image was successfully updated.' }
			format.json { head :no_content }
		  else
			format.html { render :action => "edit" }
			format.json { render :json => @image.errors, :status => :unprocessable_entity }
		  end
		end
    else
		unloggedRedirect
	end    
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
		if logged?  
		@image = Image.find(params[:id])
		news_id = @image.news_id
		@image.destroy

		respond_to do |format|
		  format.html { redirect_to edit_news_path(news_id) }
		  format.json { head :no_content }
		end
		end
    else
		unloggedRedirect
	end    
end
