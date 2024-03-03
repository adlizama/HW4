class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})

    if @user != nil
      
      if BCrypt::Password.new(@user["password"]) == params["password"]
        
        #creates cookie for the user id
        cookies["user_id"] = @user["id"]

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
  end
end
  