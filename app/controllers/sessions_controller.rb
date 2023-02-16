class SessionsController < ApplicationController
  def new
  end
  
  
  def create
    user = User.find_by(email: params[:email])

    if user.email == params[:email] && user.authenticate(params[:password])
      puts "Login réussi !"
      session[:user_id] = user.id
      redirect_to gossips_path
  
    else
      flash.now[:danger] = 'Invalid email/password combination'
      puts "FAILED !"
      render 'new'
    end
  end
  
  def destroy
    @user_to_disconnect = User.find_by(id: session[:user_id])
    session.clear
    redirect_to gossips_path, notice: "Vous avez été déconnecté"
  end

end
