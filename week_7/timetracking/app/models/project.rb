class Project < ActiveRecord::Base
  validates :name, length: { minimum: 3 }

  def self.clean_old!
    projects = Project.where("created_at < ?", Date.today - 1.week)

    projects.destroy_all
  end
end
