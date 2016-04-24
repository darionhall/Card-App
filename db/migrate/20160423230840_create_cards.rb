class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.string :profession, null: false
      t.string :email, null: false
      #email should be :string:uniq
      t.integer :phone, null: false
      t.string :websites
      t.string :skills

      t.timestamps null: false
    end
    add_index :cards, :email, unique: true
  end
end
