# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat_team do
    name { Faker::Name.title } 
    association :owner, factory: :user
    before(:create) { |chat_team| chat_team.add_owner }
  end
end
