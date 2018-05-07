require_relative( "../models/capybara.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/adoption.rb" )
require("pry")

Adoption.delete_all()
Capybara.delete_all()
Owner.delete_all()

capybara1 = Capybara.new({
  "name" => "Julian",
  "admission" => "2018-05-03",
  "age" => 5,
  "available" => 0
  })
  capybara1.save()

capybara2 = Capybara.new({
  "name" => "Xavier",
  "admission" => "2018-02-03",
  "age" => 8,
  "available" => 1
  })
capybara2.save()

capybara3 = Capybara.new({
  "name" => "Nacho",
  "admission" => "2015-05-20",
  "age" => 10,
  "available" => 1
  })
capybara3.save()

capybara4 = Capybara.new({
  "name" => "Maria",
  "admission" => "2017-12-07",
  "age" => 2,
  "available" => 1
  })
capybara4.save()

capybara5 = Capybara.new({
  "name" => "Antonio",
  "admission" => "2018-05-02",
  "age" => 4,
  "available" => 0
  })
capybara5.save()

owner1 = Owner.new({
  "name" => "Harry Marshall"
  })
owner1.save()

owner2 = Owner.new({
  "name" => "Jack Pot"
  })
owner2.save()

adoption1 = Adoption.new({
  "capybara_id" => capybara1.id,
  "owner_id" => owner1.id
  })
adoption1.save()

binding.pry
nil
