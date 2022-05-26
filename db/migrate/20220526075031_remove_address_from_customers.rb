class RemoveAddressFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :address, :string
  end
end
