json.array!(@skills) do |skill|
  json.extract! skill, :id, :title, :description, :experience
  json.url skill_url(skill, format: :json)
end
