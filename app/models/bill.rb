class Bill < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :due_day, presence: true

  scope :by_due_day, -> { order(due_day: 'ASC') }
end
