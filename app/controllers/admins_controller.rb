include ApplicationHelper
class AdminsController < ApplicationController
  # GET /admins
  # GET /admins.json
  def index
	if logged?  
		@admins = Admin.all

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render :json => @admins }
		end
	else
		unloggedRedirect
	end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  	if logged?
		@admin = Admin.find(params[:id])

		respond_to do |format|
		  format.html # show.html.erb
		  format.json { render :json => @admin }
		end
    else
		unloggedRedirect
	end
  end

  # GET /admins/new
  # GET /admins/new.json
  def new
    if logged?
		@admin = Admin.new

		respond_to do |format|
		  format.html # new.html.erb
		  format.json { render :json => @admin }
		end
    else
		unloggedRedirect
	end
  end

  # GET /admins/1/edit
  def edit
    if logged?
		@admin = Admin.find(params[:id])
    else
		unloggedRedirect
	end    
  end

  # POST /admins
  # POST /admins.json
  def create
	if logged?
		@admin = Admin.new(params[:admin])

		respond_to do |format|
		  if @admin.save
			format.html { redirect_to @admin, :notice => 'Admin was successfully created.' }
			format.json { render :json => @admin, :status => :created, :location => @admin }
		  else
			format.html { render :action => "new" }
			format.json { render :json => @admin.errors, :status => :unprocessable_entity }
		  end
    end
        else
		unloggedRedirect
	end
  end

  # PUT /admins/1
  # PUT /admins/1.json
  def update
    if logged?
		@admin = Admin.find(params[:id])

		respond_to do |format|
		  if @admin.update_attributes(params[:admin])
			format.html { redirect_to @admin, :notice => 'Admin was successfully updated.' }
			format.json { head :no_content }
		  else
			format.html { render :action => "edit" }
			format.json { render :json => @admin.errors, :status => :unprocessable_entity }
		  end
		end
    else
		unloggedRedirect
	end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if logged?
		@admin = Admin.find(params[:id])
		@admin.destroy

		respond_to do |format|
		  format.html { redirect_to admins_url }
		  format.json { head :no_content }
		end
    else
		unloggedRedirect
	end
  end
end
