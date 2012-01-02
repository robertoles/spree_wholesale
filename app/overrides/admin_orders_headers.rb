Deface::Override.new(:virtual_path => 'admin/orders/index',
  :name => 'admin_orders_headers',
  :insert_bottom => "[data-hook='admin_orders_index_headers'], #admin_orders_index_headers[data-hook]",
  :partial => "admin/hooks/admin_orders_index_headers")
