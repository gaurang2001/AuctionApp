class AddClaimedByToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :claimed_by, :int
  end
end
