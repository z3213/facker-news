class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :karma
      t.text :about
      t.string :uid

      t.timestamps
    end
  end
end
