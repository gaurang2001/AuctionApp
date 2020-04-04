class AddBbToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :bb, :integer
  end
end
