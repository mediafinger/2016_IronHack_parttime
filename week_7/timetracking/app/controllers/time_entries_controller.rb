class TimeEntriesController < ApplicationController
  def index
    project_id = params[:project_id]

    @project = Project.find(project_id)
    @entries = @project.time_entries

    render :index
  end

  def show
    render json: params
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = TimeEntry.new(project_id: @project.id) # == @project.time_entries.new
  end

  def create
    render json: params
  end
end
