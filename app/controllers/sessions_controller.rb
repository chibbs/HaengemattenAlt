class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
	respond_to do |format|
		if user && user.authenticate(params[:password])
		  session[:user_id] = user.id
		  format.js {}
		else
		  flash.now[:alert] = "Email or password is invalid"
		  format.html { render "new" }
		  format.js { render 'shared/errors' }
		end
	end
  end

  def destroy
    session[:user_id] = nil
	respond_to do |format|
		format.html { redirect_to login_url, notice: "Logged out!" }
		format.js
	end
  end

end
