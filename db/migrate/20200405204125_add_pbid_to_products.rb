class AddPbidToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pbid, :int
  end
end
