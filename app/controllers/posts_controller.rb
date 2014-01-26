class PostsController < ApplicationController

  before_action :post_owner, only: [:edit, :update, :destroy]
  #http_basic_authenticate_with :name => "dhh", :password => "secret", :except => [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @updated_posts = Post.order(updated_at: :desc)[0..5]
    @newest_posts = Post.order(updated_at: :desc)[0..5]
  end

  def new_posts
    @new_posts = Post.paginate(page: params[:page], 
                          per_page: 12,
                          :order => "created_at DESC")
    
    respond_to do |format|
      format.html
      format.js
    end

    #if request.xml_http_request?
    #  render '_post', :layout => false
    #end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    if signed_in?
      @post = Post.new
      #@step_string = "no-steps"

    else
      flash[:error] = "Please sign in to post"
      redirect_to('/signin')
    end

    
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    
    @steps_array = @post.steps.split('|')

    #return render :text => 
  end

  # POST /posts
  # POST /posts.json
  def create

   # params[:post][:step4] = "TESTING4";
    params[:post][:steps] = ""
    
    if params[:post][:step]
      params[:post][:step].each do |k, v|
        if params[:post][:step].length == k.to_i
          params[:post][:steps] << v
        else
          params[:post][:steps] << v + '|'
        end
      end
      params[:post].delete("step")
    end

    #return render :text => params[:post]
    @post = current_user.posts.create(params[:post])

    if @post.save
      flash[:success] = 'Post was successfully created.'
      redirect_to @post
    else
      render :new
    end

  end


  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    params[:post][:steps] = ""
    if params[:post][:step]    
        params[:post][:step].each do |k, v|
            if params[:post][:step].length == k.to_i
                params[:post][:steps] << v
            else
                params[:post][:steps] << v + '|'
            end
        end
    end
    params[:post].delete("step")

      if @post.update_attributes(params[:post])
        flash[:success] = 'Post was successfully created.'
        redirect_to @post 
      else
        render action: "edit"
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Destroyed post: '+@post.title
    else
      flash[:error] = 'Could not destroy post: '+@post.title
    end
    redirect_to posts_url
  end

  private
    def post_owner
      if signed_in?
        post = Post.find(params[:id])
        @owner = User.find(post.user_id)
        if current_user?(@owner) || current_user.admin?
        else
          flash[:error] = "You are not the owner!"
          redirect_to(post)
        end
      else
        post = Post.find(params[:id])
        flash[:error] = "You are not signed in!"
        redirect_to(post)
      end
    end


end
