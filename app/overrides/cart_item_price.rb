Deface::Override.new(:virtual_path => 'orders/_line_item',
  :name => 'cart_item_price',
  :replace => "[data-hook='cart_item_price'], #cart_item_price[data-hook]",
  :partial => "hooks/cart_item_price")
