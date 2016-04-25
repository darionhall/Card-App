class Card < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true
  validates :profession, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :websites
  validates :skills

  before_save :default_values

  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end
