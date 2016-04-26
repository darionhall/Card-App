class Card < ActiveRecord::Base

  belongs_to :user

  validates :card_name, :name, :profession, :email, :phone, presence: true
  # validates :websites
  # validates :skills


  private

  # def default_values
  #   self.completed ||= false
  #   nil                           # required so that TX will not rollback!!!
  # end
end
