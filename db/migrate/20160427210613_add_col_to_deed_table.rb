class AddColToDeedTable < ActiveRecord::Migration
  def change
    change_table :deeds do | t |
      t.belongs_to :category, index: true
    end
  end
end
