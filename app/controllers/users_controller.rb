class UsersController < ApplicationController
  def index
    @users = User.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
 
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      flash[:notice] = "Thanks for signing up!!."
      if @user.roles == "member"
        redirect_to civil_statuses_path  
      end
      if  @user.roles == "compagny"
         redirect_to compagnies_path  
      end
      if @user.roles == "admin"
        redirect_to cvs_path  
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @userp  = User.find(params[:id])
    @user = current_user
  end

  def update
    @userp  = User.find(params[:id])
    @user = current_user
    if @userp.update_attributes(params[:user])
      flash[:notice] = "Successfully updated account."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
