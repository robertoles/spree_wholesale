Deface::Override.new(
  :virtual_path => 'spree/shared/_products',
  :name => 'products_wholesale_price',
  :insert_after => "[data-hook='products_list_item'] .price.selling",
  :partial => "spree/hooks/products_wholesale_price",
  :disabled => false,
  :original => 'f92eb818cbfff0ab67dcce9d43cdb445d510076c' 
)
