class RemovePriceFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :price, :integer
  end
end
