class WholesalersController < Spree::BaseController
  resource_controller

  include SpreeWholesale::WholesalerController

end
