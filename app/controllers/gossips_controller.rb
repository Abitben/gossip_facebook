class GossipsController < ApplicationController
  include GossipsHelper  
  before_action :authenticate_user

  def index
    @all_gossips = Gossip.all
  end

  def show
    @id = (params[:id]).to_i
    @gossip = Gossip.find(@id)
    @comments = Comment.where(gossip_id: @gossip.id)
  end

  def new
    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content])
  end

  def create
    @user = current_user
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: @user.id)
    
    if @gossip.save  # essaie de sauvegarder en base @gossip
      redirect_to welcome_path  # si ça marche, il redirige vers la page d'index du site
    else
      render :new  # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
    if verify_user
      render :edit
    else 
      redirect_to gossips_path
    end   
  end

  def update
    @gossip = Gossip.find(params[:id])
    if verify_user && @gossip.update(title: params[:title], content: params[:content])
      redirect_to gossips_path
    else
      render :edit
    end
  end
  

  def destroy
    if verify_user
      @gossip_to_destroy = Gossip.find(params[:id])
      @gossip_to_destroy.destroy
      redirect_to gossips_path, notice: "Le gossip a été supprimé"
    else
      render :show
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  

end
