class BlogpostsController < ApplicationController

  before_action :authenticate_admin!, :only => [:new, :edit, :delete]

  def index
    @blogposts = Blogpost.all
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
    if @blogpost.save
      flash[:notice] = "Blog Post added successfully"
      redirect_to blogposts_path
    else
      flash[:alert] = "Blog Post was not added"
      render :new
    end
  end

  def edit
    @blogpost = Blogpost.find(params[:id])
  end

  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update(blogpost_params)
      flash[:notice] = "Blog Post updated successfully"
      redirect_to blogpost_path(@blogpost)
    else
      flash[:alert] = "Blog Post was not updated"
      render :edit
    end
  end

  def destroy
    @blogpost = Blogpost.find(params[:id])
    @blogpost.destroy
    flash[:notice] = "Blogpost deleted"
    redirect_to blogposts_path
  end

  private
  def blogpost_params
    params.require(:blogpost).permit(:title, :body)
  end
end
