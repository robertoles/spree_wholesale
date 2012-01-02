Deface::Override.new(:virtual_path => 'admin/orders/index',
  :name => 'admin_orders_search',
  :insert_before => "[data-hook='admin_orders_index_search_buttons']",
  :partial => "admin/hooks/admin_orders_index_search")
