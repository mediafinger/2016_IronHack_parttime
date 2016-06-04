module ProjectsHelper
  def project_name(project)
    [project.name, project.description].compact.join(" - ")
  end

  def hours_worked_in_current_month(project)
    hours = project.total_hours_in_month(Date.today.month, Date.today.year)
    hours.round(2) # display logic (could also convert the decimals back to minutes)
  end
end
