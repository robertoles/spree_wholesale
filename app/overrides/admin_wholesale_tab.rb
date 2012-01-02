Deface::Override.new(:virtual_path => "layouts/admin",
  :name => "admin_wholesale_tab",
  :insert_bottom => "[data-hook='admin_tabs']",
  :partial => "admin/hooks/wholesale_tab")
