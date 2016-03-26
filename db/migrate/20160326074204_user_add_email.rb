class UserAddEmail < ActiveRecord::Migration
  def change
    change_table :users do | t |
      t.text :email
    end
  end
end
