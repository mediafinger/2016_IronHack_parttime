class Project < ActiveRecord::Base
  belongs_to :user
  has_many :time_entries, dependent: :destroy

  ITEMS_PER_PAGE = 3

  validates :name, length: { minimum: 3 }
  validates :user, presence: true

  def self.latest
    Project.order(created_at: :desc).limit(ITEMS_PER_PAGE)
  end

  def self.clean_old!
    projects = Project.where("created_at < ?", Date.today - 1.week)

    projects.destroy_all
  end

  def total_hours_in_month(month, year)
    from = "#{year}-#{month}-01"
    to = Date.parse(from).next_month.iso8601

    entries = time_entries.where(date: from...to).pluck(:hours, :minutes)

    entries.reduce(0.0) do |sum, entry|
      sum += entry[0] + entry[1].to_f / 60
    end
  end
end
