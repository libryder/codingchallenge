require 'machinist/active_record'

User.blueprint do
  email { "email#{sn}@test.com" }  # Each user gets a unique serial number.
  password { 'password' }
end

User.blueprint(:admin) do
  email { "email#{sn}@test.com" }  # Each user gets a unique serial number.
  password { 'password' }
  roles { ['admin'] }
end  

Solution.blueprint do
  challenge { challenge }
  solution_url { "http://gist.github.com" }
  notes { "Sample solution notes" }
end

Challenge.blueprint do
  description { "Sample challenge" }
  title { "My Title" }
  source { 'http://google.com' }
end