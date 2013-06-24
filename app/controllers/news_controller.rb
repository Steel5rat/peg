include NewsHelper
class NewsController < ApplicationController
  # GET /news
  # GET /news.json
  def index
    #@news = News.all
    #ASC
	@news = News.order("created_at DESC").paginate(:page => params[:page]) #sort & paginate
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @news }
    end
    
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @news }
    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
	if logged?
		@news = News.create
		
		respond_to do |format|      
		  format.html { redirect_to edit_news_path(@news ), :action => 'edit' } # new.html.erb
		  format.json { render :json => @news }
		end
    else
		unloggedRedirect
	end    
  end

  # GET /news/1/edit
  def edit
	if logged?  
		@news = News.find(params[:id])
		@images = Image.where(:news_id => params[:id]).order("created_at ASC")
		@tags = []
		@images.each do |a|
			@tags+=['<img'+a.id.to_s+'>']
		end
	else
		unloggedRedirect
	end
  end

  # POST /news
  # POST /news.json
  def create
  	if logged?
		@news = News.new(params[:news])

		respond_to do |format|
		  if @news.save
			format.html { redirect_to @news, :notice => 'News was successfully created.' }
			format.json { render :json => @news, :status => :created, :location => @news }
		  else
			format.html { render :action => "new" }
			format.json { render :json => @news.errors, :status => :unprocessable_entity }
		  end
		end
	else
		unloggedRedirect
	end    
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
  	if logged?  
		@news = News.find(params[:id])

		respond_to do |format|
		  if @news.update_attributes(params[:news])
			format.html { redirect_to @news, :notice => 'News was successfully updated.' }
			format.json { head :no_content }
		  else
			format.html { render :action => "edit" }
			format.json { render :json => @news.errors, :status => :unprocessable_entity }
		  end
		end
	else
		unloggedRedirect
	end    
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
  	if logged?  
		@news = News.find(params[:id])
		@news.destroy

		respond_to do |format|
		  format.html { redirect_to news_index_url }
		  format.json { head :no_content }
		end
    else
		unloggedRedirect
	end 
  end  
end
