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

combos_ary.compact!.reject!{ |char| char == ":" }

i = 0
valid_combos = Hash.new

until i == combos_ary.length
  hand = combos_ary[i..i+3].join(" ")
  soln = combos_ary[i+4]
  valid_combos[hand] = soln
  i += 5
end

p valid_combos

# CSV.open("hands.csv", "a+") do |csv|
#
# end
