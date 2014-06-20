json.array!(@chat_teams) do |chat_team|
  json.extract! chat_team, :id, :name, :user_id
  json.url chat_team_url(chat_team, format: :json)
end
