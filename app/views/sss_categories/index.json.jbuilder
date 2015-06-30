json.array!(@sss_categories) do |sss_category|
  json.extract! sss_category, :id, :sss_id, :category_id
  json.url sss_category_url(sss_category, format: :json)
end
