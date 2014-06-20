# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat_log do
    message {Faker::Lorem.sentence}
    user

    factory :empty_log do
      message nil
    end
  end
end
