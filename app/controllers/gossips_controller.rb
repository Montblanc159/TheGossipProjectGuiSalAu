class GossipsController < ApplicationController
  def index
  end

  def show
    @current_gossip = Gossip.find(params[:id])
  end

  def new
  end

  def create
    @gossip = Gossip.new_gossip(params)

    if @gossip.save
      flash[:success] = "Potin enregistré !"
      redirect_to root_path
    else
      flash[:danger] = "Veuillez remplir correctement les champs."
      render new_gossip_path
    end
  end

  def edit
    @current_gossip = Gossip.find(params[:id])
  end

  def update
    @current_gossip = Gossip.find(params[:id])
    if @current_gossip.update(params[:title], params[:content])
      flash[:success] = "Le potin a été mis à jour !"
      redirect_to @current_gossip
    else
      flash[:danger] = "Veuillez remplir correctement les champs."
      render :edit
    end
  end
end
