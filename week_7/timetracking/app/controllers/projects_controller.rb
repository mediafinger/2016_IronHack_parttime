class ProjectsController < ApplicationController
  def index
    @projects = Project.latest
  end

  def show
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # write the error to the logs
    # mention the controller / model / params
    log_error(message: "Project not found", status: "404", params: params)

    render "layouts/404"
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    project.save
    redirect_to projects_path
  end
end
