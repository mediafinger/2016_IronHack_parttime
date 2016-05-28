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
end
