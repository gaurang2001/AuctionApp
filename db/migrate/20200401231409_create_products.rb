class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :pid
      t.string :name
      t.text :desc
      t.float :startbid
      t.datetime :deadline
      t.string :contact

      t.timestamps
    end
  end
end
