class AddAcceptAndCompleteColumns < ActiveRecord::Migration
  def change
    change_table :orders do | t |
      t.integer :accept_id
      t.boolean :complete
    end
  end
end
