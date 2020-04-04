class AddUnameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :uname, :string
  end
end
