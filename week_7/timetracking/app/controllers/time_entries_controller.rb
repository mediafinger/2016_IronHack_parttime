class TimeEntriesController < ApplicationController
  before_action :authenticate!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_project_for_current_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_project, only: [:show, :index]
  before_action :set_time_entries # run before any action

  before_action :set_project, :set_time_entries # run before any action
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @entry = @entries.new
  end

  def create
    @entry = @entries.new(entry_params)

    if @entry.save
      flash[:notice] = "Entry created successfully"
      redirect_to project_time_entries_path(@project)
    else
      flash.now[:alert] = "Entry could not be created"
      @errors = @entry.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      redirect_to project_time_entries_path(@project)
    else
      @errors = @entry.errors.full_messages
      render :edit
    end
  end

  def destroy
    @entry.destroy
    flash[:notice] = "Entry #{@entry.id} deleted."

    redirect_to project_time_entries_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_project_for_current_user
    @project = current_user.projects.find(params[:project_id])
  end

  def set_time_entries
    @entries = @project.time_entries
  end

  def set_entry
    @entry = @entries.find(params[:id])
  end

  def entry_params
    params.require(:time_entry).permit(:hours, :minutes, :date)
  end
end
