class TimeEntry < ActiveRecord::Base
  belongs_to :project

  validates :hours, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 23 }
  validates :minutes, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }
end
