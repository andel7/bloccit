class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:topic_id])
    @comment = Comment.new
    authorize @comment
  end


  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:topic_id])
    @comment = @post.comments.build(comment_params)
    @comment.post = @post
    @comment.user = current_user
    authorize @comment
    if @comment.save
      flash[:notice] = "Post was saved"
      redirect_to [@topic,@post]
    else
      flash[:error] = "There was an error saving the post. Please try again"
      redirect_to [@topic,@post]
      #render :new
    end
  end

    def comment_params
    params.require(:comment).permit(:body,:post,:user)
  end

end
