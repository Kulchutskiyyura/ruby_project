
class CommentsController < ApplicationController
    before_action :authenticate_user! , except: [:index,:show]
    
    def index
      @comments = Comment.all
    end
  
    # GET /posts/1
    # GET /posts/1.json
    def show
    end
  
    # GET /posts/new
    def new
      @comment = Comment.new
    end
    def edit
      @post = Post.find(params[:post_id]) 
      
    end
    def create

    # Get Article comment is attached to

      @post = Post.find(params[:post_id])

      # Create and save comment
      

      @comment = @post.comments.create(comment_params)

      # Go to the article this comment is associated with
      #@comment.user_email="vjojewo"
      redirect_to post_path(@post)
    end
    def destroy
      @post= Post.find(params[:post_id])
      @comment= @post.comments.find(params[:id])
      @comment.destroy
      redirect_to post_path(@post)

    end
    

    private
      def comment_params
        params.require(:comment).permit(:body,:user_email)
    end
  end