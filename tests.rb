require 'json'
require 'open-uri'

url = 'https://fr.wikipedia.org/api/rest_v1/page/random/title'
title_serialized = open(url).read
title = JSON.parse(title_serialized)

puts "#{title["items"][0]['title']}"
