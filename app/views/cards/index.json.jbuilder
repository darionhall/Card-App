json.array!(@cards) do |card|
  json.extract! card, :id, :card_name, :name, :profession, :email, :phone, :websites, :skills
  json.url card_url(card, format: :json)
end
