Deface::Override.new(:virtual_path => 'admin/orders/index',
  :name => 'admin_orders_rows',
  :insert_bottom => "[data-hook='admin_orders_index_rows'], #admin_orders_index_rows[data-hook]",
  :partial => "admin/hooks/admin_orders_index_rows")
