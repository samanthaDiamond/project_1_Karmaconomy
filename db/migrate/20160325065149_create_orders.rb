class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.belongs_to :deed, index: true
      t.integer :karma
      t.timestamps
    end
  end
end
