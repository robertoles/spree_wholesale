Deface::Override.new(
  :name => "add_wholesale_price_to_admin_variants_form",
  :virtual_path => "admin/variants/_form",
  :insert_bottom => "[data-hook='variants']",
  :partial => 'admin/variants/wholesale_price')