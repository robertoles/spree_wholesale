Deface::Override.new(:virtual_path => 'admin/products/form',
  :name => 'productform_right',
  :replace => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
  :partial => "admin/hooks/product_form_right")
