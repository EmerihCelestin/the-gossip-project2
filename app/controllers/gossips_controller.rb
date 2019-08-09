class GossipsController < ApplicationController
  def index
    @all_users= User.all
    @all_gossips= Gossip.all
    @all_cities= City.all
  end

  def show
    @gossip = Gossip.find(params['id'])
    @user = @gossip.user
    @city = @user.city
  end

  def new
  end

  def create
    title = params['title']
    content = params['content']
    @gossip = Gossip.new(title: title,content: content, user_id: 11) # avec xxx qui sont les données obtenues à partir du formulaire

  if @gossip.save # essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
    redirect_to gossips_path, :notice => "The super potin was succesfully saved !"

  else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    render'new'
  end
  end

  def edit
    @gossip = Gossip.find(params['id'])
  end

 def update
  @gossip = Gossip.find(params[:id])
  title = params['title']
  content = params['content']
    if @gossip.update(title: title, content: content)
      redirect_to gossips_path, :alert => "Gossip was succesfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    @gossip.destroy
    redirect_to gossips_path, :notice => "Gossip Removed"
  end
end
