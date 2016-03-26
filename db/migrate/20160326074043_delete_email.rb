class DeleteEmail < ActiveRecord::Migration
  def change
    change_table :deeds do | t |
      t.remove :email
    end
  end
end
