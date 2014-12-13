class CommentsController < ApplicationController
  def new
    
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.new
    authorize @comment
  end


  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.build(comment_params)
    @comment.post = @post
    @comment.user = current_user
    authorize @comment
    if @comment.save
      flash[:notice] = "Post was saved"
      redirect_to [@topic,@post]
    else
      render 'posts/show'
      #render :new
    end
  end

   def destroy
     @post = Post.find(params[:post_id])
     @topic = @post.topic
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end

  def comment_params
    params.require(:comment).permit(:body,:post,:user)
  end

end
