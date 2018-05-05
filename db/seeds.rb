require_relative( "../models/capybara.rb" )
# require_relative( "../models/owner.rb" )
# require_relative( "../models/adoption.rb" )
require("pry")


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

binding.pry
nil
