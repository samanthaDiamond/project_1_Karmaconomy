class KarmaToInt < ActiveRecord::Migration
  def change
  change_table :deeds do | t |
    t.remove :karma
    t.integer :karma
    end
  end
end
