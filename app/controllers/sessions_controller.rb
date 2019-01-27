class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
	respond_to do |format|
		if user && user.authenticate(params[:password])
		  flash[:notice] = "You have been logged in."
		  session[:user_id] = user.id
		  format.js {}
		else
		  flash[:alert] = "Email or password is invalid"
		  format.html { render "new" }
		  format.js { render "new" }
		end
	end
  end

  def destroy
    session[:user_id] = nil
	respond_to do |format|
		flash.notice = "You have been logged out! You can log in again :-)"
		format.html { redirect_to login_url, notice: "Logged out!" }
		format.js
	end
  end

end
