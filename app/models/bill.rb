class Bill < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :due_day, presence: true
end
