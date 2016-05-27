class ProjectsController < ApplicationController
  def index
    @projects = Project.order(created_at: :desc).limit(3)
  end
end
