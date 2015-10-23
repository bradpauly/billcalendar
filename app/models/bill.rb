class Bill < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :due_day, presence: true

  scope :by_due_day, -> { order(due_day: 'ASC') }

  def summary
    if auto_pay?
      "#{name} is auto paid"
    else
      "#{name} is due"
    end
  end
end
