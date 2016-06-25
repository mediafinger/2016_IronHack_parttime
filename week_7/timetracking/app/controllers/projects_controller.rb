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
    @project = current_user.projects.new
  end

  def create
    project = current_user.projects.new(project_params)
    project.save!
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:description, :name)
  end
end
