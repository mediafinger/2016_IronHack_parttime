class ProjectsController < ApplicationController
  def index
    @projects = Project.latest
  end
end
