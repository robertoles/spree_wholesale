Deface::Override.new(:virtual_path => 'users/show',
  :name => 'wholesale_my_orders',
  :insert_before => "[data-hook='account_my_orders'], #account_my_orders[data-hook]",
  :partial => "hooks/wholesale_customer")
