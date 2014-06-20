# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    admin { false }

    factory :admin do 
      admin { true }
    end

  end
end
