class AddStatusToOrders < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE order_status AS ENUM ('pending', 'confirmed', 'delivered', 'canceled');
    SQL
    add_column :orders, :status, :order_status, default: 'pending'
  end

  def down
    remove_column :orders, :status
    execute <<-SQL
      DROP TYPE order_status;
    SQL
  end
end
