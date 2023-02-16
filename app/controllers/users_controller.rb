class UsersController < ApplicationController
  def new
    @user = User.new
    @all_cities =[]
    (City.all).each do |city|
      @all_cities << city.name
    end
  end


  def create
    @user = User.new(post_params)
    
    if @user.save # essaie de sauvegarder en base @gossip
      @user = User.find_by(email: params[:user][:email])
      log_in(@user)
      redirect_to gossips_path  # si ça marche, il redirige vers la page d'index du site
    else
      render :new # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end

  end
  
  
  def show
    @user = User.find_by(first_name: params[:id])
    @first_name = params[:id]
  end

  private

  def post_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
  end

end