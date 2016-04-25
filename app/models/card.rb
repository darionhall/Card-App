class Card < ActiveRecord::Base

  belongs_to :user

  validates :name, :profession, :email, :phone presence: true
  # validates :websites
  # validates :skills

  before_save :default_values

  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end
