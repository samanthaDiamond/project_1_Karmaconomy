class ChangeTable < ActiveRecord::Migration
  def change
    change_table :deeds do |t|
      t.remove :location
      t.integer :postcode
      t.timestamps
    end
  end
end
