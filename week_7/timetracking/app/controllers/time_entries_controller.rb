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
    @project = Project.find(params[:project_id])

    @entry = @project.time_entries.new(entry_params)
    # alternative way:
    # create_params = entry_params.merge(project_id: @project.id)
    # @entry = TimeEntry.new(create_params)

    if @entry.save
      redirect_to project_time_entries_path(@project)
    else
      @errors = @entry.errors.full_messages
      render :new
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.time_entries.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = @project.time_entries.find(params[:id])

    if @entry.update(entry_params)
      redirect_to project_time_entries_path(@project)
    else
      @errors = @entry.errors.full_messages
      render :edit
    end
  end

  private

  def entry_params
    params.require(:time_entry).permit(:hours, :minutes, :date)
  end
end
