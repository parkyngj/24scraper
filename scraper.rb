require 'pp'
require_relative 'urltonokogiri'

url1_2 = "http://www.gottfriedville.net/games/24/index.shtml"

url1_2_noko_page = UrlToNokogiri.convert_url_to_ng(url1_2)

combos_str = url1_2_noko_page.children[1].children[1].children.last.children.children.children.children.text

combos_ary = combos_str.split(" ")

combos_ary.each_with_index.map do |char,index|
  if char != "nope"
    next
  else
    for idx in (index-5..index) do
      combos_ary[idx] = nil
    end
  end
end

p combos_ary.compact
