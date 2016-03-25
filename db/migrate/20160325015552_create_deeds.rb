class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.text :title
      t.text :description
      t.text :location
      t.text :date
      t.text :image
      t.text :karma
      t.text :deed_type
    end
  end
end
