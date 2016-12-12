require 'net/http'
require 'uri'
require 'nokogiri'
require_relative 'html_whitespace_cleaner'

# step 0: use URI.parse('url') to parse the webpage
  #=> #<URI ...>
# step 1: convert the parsed URI from step 0 to an html string
  # Net::HTTP.get(uri)
  #=> String
# step 2: strip the HTML file of whitespace
  # HTMLWhitespaceCleaner.clean(html_string)
  #=> String without whitespaces, escapers, etc.
# step 3: call the Nokogiri method parse on the clean HTML string
  # Nokogiri.parse(clean_html_string)
  #=> #<Nokogiri ...>

module UrlToNokogiri
  def self.parse_url(url_string)
    URI.parse(url_string)
  end

  def self.convert_uri_to_htmlstring(uri_obj)
    Net::HTTP.get(uri_obj)
  end

  def self.convert_url_to_ng(url_string)
    Nokogiri.parse(HTMLWhitespaceCleaner.clean(convert_uri_to_htmlstring(parse_url(url_string))))
  end
end
