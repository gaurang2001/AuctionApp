class AddUserToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :user, foreign_key: {on_delete: :cascade}
  end
end
