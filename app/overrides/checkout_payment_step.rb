Deface::Override.new(:virtual_path => 'checkout/payment',
  :name => 'checkout_payment_step',
  :insert_before => "[data-hook='checkout_payment_step'], #customer_payment_step[data-hook]",
  :partial => "hooks/wholesale_payment_options")
