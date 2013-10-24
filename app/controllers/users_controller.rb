class UsersController < ApplicationController

  def create
    filtered_params = params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :provider, :provider_uid)
    @user = User.new(filtered_params)
    if @user.valid?
      @user.save!

      respond_to do |format|
        format.html { redirect_to root_url, :notice => 'User successfully created' }
      end
    else
      respond_to do |format|
        format.html { render :action => "new" }
      end
    end
  rescue => e
    logger.error e.inspect
    logger.error e.backtrace.join("\n")
    flash[:error] = "We are sorry but something went wrong."
    respond_to do |format|
      format.html { render :action => "new" }
    end
  end

  def update
    filtered_params = params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(filtered_params)
        format.html { redirect_to @user, :notice => 'User updated' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end
end
