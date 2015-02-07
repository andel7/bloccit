class FavoritesController < ApplicationController

  def create
      @post = Post.find(params[:post_id])
      favorite = current_user.favorites.build(post: @post)

      authorize favorite 
      if favorite.save
          flash[:notice] = "The post has been favorited"
          redirect_to [@post.topic,@post]
      else
          flash[:notice] = "Shit hit the fan - try again later"
          redirect_to [@post.topic,@post]
      end
  end

  def destroy 
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.where(post: @post).first
     
    authorize favorite 
    if favorite.destroy
          flash[:notice] = "The post has been unfavorited"
          redirect_to [@post.topic,@post]
    else
          flash[:notice] = "The post has been favorited"
          redirect_to [@post.topic,@post]
    end  
  end
end
