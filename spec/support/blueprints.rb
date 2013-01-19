require 'machinist/active_record'

User.blueprint do
  email { "email#{sn}@test.com" }  # Each user gets a unique serial number.
  password { 'password' }
end

User.blueprint(:admin) do
  email { "email#{sn}@test.com" }  # Each user gets a unique serial number.
  password { 'password' }
  roles { ['admin'] }
  is_admin { true }
end  

User.blueprint(:twitter) do
  provider { 'twitter' }
  uid { '1234567890' }
  username { 'twitter-dude' }
end

User.blueprint(:github) do
  provider { 'github' }
  uid { '1234567890' }
  username { 'github-chick' }
end

Solution.blueprint do
  challenge { challenge }
  source { "Sample solution notes" }
  title { "Some random title" }
  language { 'ruby' }
end

Solution.blueprint(:ruby) do 
  language { "ruby" }
end

Solution.blueprint(:other) do 
  language { "other" }
end

Challenge.blueprint do
  description { "Sample challenge" }
  title { "My Title" }
  source { 'http://google.com' }
end