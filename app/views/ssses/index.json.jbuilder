json.array!(@ssses) do |sss|
  json.extract! sss, :id, :question, :answer
  json.url sss_url(sss, format: :json)
end
