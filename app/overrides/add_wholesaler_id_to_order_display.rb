Deface::Override.new(:virtual_path => 'spree/orders/show',
  :name => 'add_wholesaler_id_to_order_display',
  :insert_top => "#order[data-hook]",
  :partial => "spree/hooks/wholesale_customer_id",
  :disabled => false
)
