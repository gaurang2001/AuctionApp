class AddPbidpriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pbidprice, :float
  end
end
