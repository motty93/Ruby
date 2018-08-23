require 'nokogiri'
require 'open-uri'
require 'csv'

(1..4).each do |num|
  url = if num == 1
           'http://nikibihikaku.info/products'
        else
           "http://nikibihikaku.info/products/page-0#{num}"
        end

  charset = nil

  html = open(url) do |f|
    charset = f.charset
    f.read
  end

  doc = Nokogiri::HTML.parse(html, nil, charset)

  footer = doc.css('section')
  li_list = footer.css('li')
  li_list.each do |product|
    url = product.css('a.Btn01--green')
    p url&.first[:href] unless url.empty?
  end
end
