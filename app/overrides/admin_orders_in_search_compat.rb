# Fix for edge Spree.
Deface::Override.new(:virtual_path => 'admin/orders/index',
  :name => 'admin-orders-search-compat',
  :insert_bottom => "#admin_orders_index_search[data-hook]",
  :partial => "admin/hooks/admin_orders_index_search")
  