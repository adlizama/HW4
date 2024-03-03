class SessionsController < ApplicationController
  def new
    #render login form in sessions/new.html.erb
  end

  def create
    @user = User.find_by({"email" => params["email"]})

    if @user != nil
      
      if BCrypt::Password.new(@user["password"]) == params["password"]
        
        #creates cookie for the user id
        session["user_id"] = @user["id"]

        flash["notice"] = "Welcome"
        redirect_to "/places"
      else
        flash["notice"] = "Nope."
        redirect_to "/login"
      end

    
    else
      flash["notice"] = "Nope."
      redirect_to "/login"

    end
  end
  
  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end

end

