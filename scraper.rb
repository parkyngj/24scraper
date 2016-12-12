require 'csv'
require_relative 'urltonokogiri'

url1_2 = "http://www.gottfriedville.net/games/24/index.shtml"

url1_2_noko_page = UrlToNokogiri.convert_url_to_ng(url1_2)

combos1_2_str = url1_2_noko_page.children[1].children[1].children.last.children.children.children.children.text

combos1_2_ary = combos1_2_str.split(" ")

combos1_2_ary.each_with_index.map do |char,index|
  if char != "nope"
    next
  else
    for idx in (index-5..index) do
      combos1_2_ary[idx] = nil
    end
  end
end

combos1_2_ary.compact!.reject!{ |char| char == ":" }

i = 0
valid1_2_combos = Hash.new

until i == combos1_2_ary.length
  hand = combos1_2_ary[i..i+3].join(" ")
  soln = combos1_2_ary[i+4]
  valid1_2_combos[hand] = soln
  i += 5
end

CSV.open("hands.csv", "a+") do |csv|
  valid1_2_combos.each do |hand,soln|
    csv << [hand, soln]
  end
end
