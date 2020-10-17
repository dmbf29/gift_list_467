require 'open-uri'
require 'nokogiri'


def scrape(keyword)
  # filepath = "results.html"
  # html_content = File.open(filepath)
  # 2. We build a Nokogiri document from this file
  html_content = open("https://www.etsy.com/search?q=#{keyword}").read
  doc = Nokogiri::HTML(html_content)
  etsy_list = {}
  # 3. We search for the correct elements containing the items' title in our HTML doc
  doc.search('.v2-listing-card .v2-listing-card__info .text-body').first(5).each do |element|
    # 4. For each item found, we extract its title and print it
    gift = element.text.strip
    etsy_list[gift] = false
  end
  return etsy_list
end
