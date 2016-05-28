class ProjectsController < ApplicationController
  def index
    @projects = Project.latest
  end

  def show
    @project = Project.find_by(id: params[:id])
  end
end
