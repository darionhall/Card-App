class ChangePhoneInCard < ActiveRecord::Migration
  def change
    change_column :cards, :phone, :string
  end
end
