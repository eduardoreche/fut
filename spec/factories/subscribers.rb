# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscriber do
    first_name "Firstname"
    last_name "Lastname"
    email "subscriber@example.com"
    accept_terms true
  end
end
