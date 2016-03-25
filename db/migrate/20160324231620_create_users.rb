class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :username
      t.integer :postcode
      t.text :biography
      t.text :image
      t.integer :karma
      t.timestamps
    end
  end
end
