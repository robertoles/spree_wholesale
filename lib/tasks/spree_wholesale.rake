namespace :spree_wholesale do

  desc "Creates wholesale role"
  task :create_role => :environment do
    name = "wholesaler"
    role = Spree::Role.find_by_name(name) rescue nil
    if role
      puts "Role exists!"
    else
      role = Spree::Role.create(:name => name)
      puts "Role created!"
    end

    puts role.inspect
  end

  desc "Assumes 50% wholesale discount for each variant"
  task :assume_wholesale_prices => :environment do
    Spree::Variant.all.each do |variant|
      price = variant.price * 0.5
      ActiveRecord::Base.connection.execute("UPDATE spree_variants SET wholesale_price = #{price} WHERE id = #{variant.id}")
    end
  end
end

namespace :db do
  namespace :sample do

    desc "Create sample wholesalers"
    task :wholesalers => :environment do
      if Spree::Order.count == 0
        puts "Please run `rake db:sample` first to create products and orders" 
        exit
      end

      @usa = Spree::Country.find_by_iso("US")
      @ca  = @usa.states.find_by_abbr("CA") 
      count = Spree::Wholesaler.count
      5.times do |i|
        name = "Wholesaler #{count + i + 1}"
        wholesaler = Spree::Wholesaler.new(:company => name, :phone => "800-555-5555", :buyer_contact => "SomeBuyer", :manager_contact => "SomeManager", :phone => "555-555-5555", :taxid => "234234#{count}")
        wholesaler.user = Spree::User.offset(i+1).limit(1).first
        wholesaler.build_bill_address(:firstname => name, :lastname => name, :address1 => "100 State St", :city => "Santa Barbara", :phone => "555-555-5555", :zipcode => "93101", :state_id => @ca.id, :country_id => @usa.id)
        wholesaler.save!
      end
      puts "#{Spree::Wholesaler.count - count} Wholesalers Created."

      @wholesalers = Spree::Wholesaler.all
      Spree::Order.limit(5).each_with_index do |order, idx|
        order.user = @wholesalers[idx].user
        order.wholesale = true
        order.save
      end
      puts "5 Wholesale Orders Created."
    end

  end
end
