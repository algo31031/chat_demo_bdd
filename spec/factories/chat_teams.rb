# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat_team do
    name { Faker::Name.title } 
    user
  end
end
