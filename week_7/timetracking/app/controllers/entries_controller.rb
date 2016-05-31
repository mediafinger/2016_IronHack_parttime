class EntriesController < ApplicationController
  def index
    project_id = params[:id]

    @project = Project.find(project_id)
    @entries = @project.time_entries

    render json: @entries # for quick testing only
  end
end
