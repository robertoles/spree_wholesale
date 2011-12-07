Deface::Override.new(
  :name => "show_wholesale_price_in_products_list",
  :virtual_path => "shared/_products",
  :replace => "#products[data-hook] span.price.selling",
  :text => %q{<%= link_to raw(product.name + " <span class='price selling'>#{product_price(product)}</span>"), product, :class => 'info' %>}
)
