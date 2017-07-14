json.array!(@all_diaries) do |diary|
  json.id diary.id
  json.nation_name diary.nation_name
  json.city_name diary.city_name
  json.article_title diary.article_title
end
