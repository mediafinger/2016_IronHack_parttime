module ProjectsHelper
  def project_name(project)
    [project.name, project.description].compact.join(" - ")
  end
end
