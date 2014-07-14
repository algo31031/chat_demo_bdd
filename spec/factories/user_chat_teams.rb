# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_chat_team do
    user_id 1
    chat_team_id 1
    is_online false
    has_new_messga false
    faye_client_id "MyString"
  end
end
