class SkillsController < ApplicationController
  before_action :authenticate_admin!, :only => [:new, :edit, :delete]

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      flash[:notice] = "Skill added successfully"
      redirect_to skills_path
    else
      flash[:alert] = "Skill was not added"
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      flash[:notice] = "Skill updated successfully"
      redirect_to skill_path(@skill)
    else
      flash[:alert] = "Skill was not updated"
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    flash[:notice] = "Skill deleted"
    redirect_to skills_path
  end

  private
  def skill_params
    params.require(:skill).permit(:skill_name, :proficiency_level)
  end
end
