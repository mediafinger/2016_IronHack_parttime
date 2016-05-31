class Project < ActiveRecord::Base
  has_many :time_entries, dependent: :destroy

  ITEMS_PER_PAGE = 3

  validates :name, length: { minimum: 3 }

  def self.latest
    Project.order(created_at: :desc).limit(ITEMS_PER_PAGE)
  end

  def self.clean_old!
    projects = Project.where("created_at < ?", Date.today - 1.week)

    projects.destroy_all
  end

  def total_hours_in_month(month, year)
    # uses all time_entries of the project
    # of the given month and year

    # where the magic happens

    # returns hours worked
  end
end
