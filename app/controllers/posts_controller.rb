class PostsController < ApplicationController
  before_filter :find_Post, :only => [:show, :edit, :update, :destroy]
  
  # First to show
  def index
    # Catch all the data
    @posts = Post.all
  end

  # New a empty Post object
  def new
    @post = Post.new
  end
  
  # sending by new.html.erb, initial a new post object and save it, then redirect to indext page 
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_path(@post)
    else
      render :action => "new"
    end
  end
  
  # By using find method to find the data
  def show
    
  end
  
  # 1. Find the data 2. Update to database
  def edit
    
  end
  def update
		
		if @post.update_attributes(params[:post])
		  redirect_to post_path(@post)
		else
		  render :action => "edit" 
		end
  end
  
  # delete the data  you choice 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  protected 
  def find_Post
    @post = Post.find(params[:id])
  end
  
end
