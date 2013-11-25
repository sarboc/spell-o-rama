require 'nokogiri'
require 'open-uri'

url = "http://translate.google.com/translate_tts?tl=en&q=Anil%20is%20Awesome"

data = open(url).read

puts data