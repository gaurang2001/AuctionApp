class AddTbidToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :tbid, :int, :default => 0
  end
end
