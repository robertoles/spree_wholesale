Deface::Override.new(:virtual_path => 'orders/_line_item',
  :name => 'cart_item_total',
  :replace => "[data-hook='cart_item_total'], #cart_item_total[data-hook]",
  :partial => "hooks/cart_item_total")
