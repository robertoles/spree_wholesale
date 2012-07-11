require 'test_helper'

class Spree::WholesalerTest < ActiveSupport::TestCase

  def setup
    # nada
  end

  should belong_to(:user)
  should belong_to(:bill_address)
  should belong_to(:ship_address)

  should validate_presence_of(:company)
  should validate_presence_of(:buyer_contact)
  should validate_presence_of(:manager_contact)
  should validate_presence_of(:phone)
  should validate_presence_of(:taxid)

  context "with a new wholesaler" do

    setup do
      @wholesaler = Factory.build(:wholesaler, :user => nil, :ship_address => nil, :bill_address => nil)
    end

    should "create valid wholesaler" do
      @wholesaler.user = Factory.create(:wholesale_user)
      @wholesaler.bill_address = @wholesaler.ship_address = Factory.create(:address)
      assert @wholesaler.valid?
      assert @wholesaler.save
    end

  end

  context "with an existing wholesaler" do

    setup do
      @wholesaler = Factory.create(:wholesaler,
        :user         => Factory.create(:wholesale_user),
        :bill_address => Factory.create(:address),
        :ship_address => Factory.create(:address)
      )
    end

    should "activate" do
      @wholesaler.roles = [Spree::Role.find_by_name("user")]

      assert !@wholesaler.active?
      @wholesaler.activate!
      assert @wholesaler.active?
    end

    should "deactivate" do
      @wholesaler.roles = [Spree::Role.find_by_name("wholesaler")]

      assert @wholesaler.active?
      @wholesaler.deactivate!
      assert !@wholesaler.active?
    end

  end

  context 'active and inactive scopes' do

    setup do
      @wholesaler_1 = Factory.create(:wholesaler, :user => Factory.create(:wholesale_user))
      @wholesaler_1.deactivate!
      @wholesaler_2 = Factory.create(:wholesaler, :user => Factory.create(:wholesale_user))
      @wholesaler_2.activate!
      @wholesaler_3 = Factory.create(:wholesaler, :user => Factory.create(:wholesale_user))
      @wholesaler_3.deactivate!
    end

    should 'only return active wholesalers for active scope' do
      assert_equal [@wholesaler_2], Spree::Wholesaler.active
    end

    should 'only return inactive wholesalers for inactive scope' do
      assert_equal [@wholesaler_1, @wholesaler_3], Spree::Wholesaler.inactive
    end

  end

end
