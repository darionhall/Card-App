class AddCardNameToCards < ActiveRecord::Migration
  def change
    add_column :cards, :card_name, :string
  end
end
