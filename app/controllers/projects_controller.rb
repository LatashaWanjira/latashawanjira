class ProjectsController < ApplicationController
  before_action :authenticate_admin!, :only => [:new, :edit, :destroy]


  def index
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project added successfully"
      redirect_to projects_path
    else
      flash[:alert] = "Project was not added"
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project updated successfully"
      redirect_to project_path(@project)
    else
      flash[:alert] = "Project was not updated"
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project deleted"
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:project_name, :description, :link, :image, :tag_list)
  end
end
