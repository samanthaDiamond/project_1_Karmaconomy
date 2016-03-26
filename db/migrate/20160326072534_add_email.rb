class AddEmail < ActiveRecord::Migration
  def change
    change_table :deeds do | t |
      t.text :email
    end
  end
end
