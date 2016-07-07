class ProjectsController < ApplicationController
  before_action :authenticate!, only: [:new, :create]

  def index
    remember_highest_visited_page

    @projects = Project.order(updated_at: :desc).page(params[:page])
  end

  def show
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # write the error to the logs
    # mention the controller / model / params
    log_error(message: "Project not found", status: "404", params: params)

    render "layouts/404", status: 404
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

  def remember_highest_visited_page
    cookies.encrypted[:projects_page_at] = Time.now.utc.iso8601

    if Date.today > Date.parse(cookies.encrypted[:projects_page_at])
      cookies.encrypted[:projects_page].delete
      return 0
    else
      cookies.encrypted[:projects_page] = [cookies.encrypted[:projects_page], params[:page]].compact.max
    end
  end

  def project_params
    params.require(:project).permit(:description, :name)
  end
end
