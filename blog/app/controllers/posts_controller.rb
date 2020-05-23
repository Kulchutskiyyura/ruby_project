class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:index,:show,:tagged]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @all_post=[]
      Post.all.each  do |post|
        @all_post.append(post.category_list)
      end
    @all_post=@all_post.uniq
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end
 
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def tagged
    if params[:category].present?
      @posts = Post.tagged_with(params[:category])
      zmin=Post.all - Post.tagged_with(params[:category])
      @all_post=[]
      zmin.each  do |post|
        @all_post.append(post.category_list)
      end
      @all_post=@all_post.uniq
    else
      @posts = Post.all
      @all_post=[]
      Post.all.each  do |post|
        @all_post.append(post.category_list)
      end
      @all_post=@all_post.uniq
      puts @all_post
     #append
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body,:category_list,:image)
    end
end
