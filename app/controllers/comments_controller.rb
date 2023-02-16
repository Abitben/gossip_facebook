class CommentsController < ApplicationController
  def index
    @all_comments = Comment.all
  end

  def show
    @id = (params[:id]).to_i
    @comment = Gossip.find(@id)
  end
  
  def new
    @comment = Comment.new(
      'content' => params[:content])
  end

  def create

    @gossip = Gossip.find_by(id: params[:gossip_id])

    @comment = Comment.new(content: params[:content],user_id: current_user.id ,gossip_id: @gossip.id )

      if @comment.save! # essaie de sauvegarder en base @gossip
        redirect_to gossips_path(params[:gossip_id]), notice: 'Commentaire créé avec succès.'  # si ça marche, il redirige vers la page d'index du site
      else
        render 'gossips/show'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
  end

end
