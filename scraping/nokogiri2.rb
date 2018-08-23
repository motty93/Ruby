require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'http://xn--gmq430ja921z.com/?search_element_5_0=on&searchbutton=%E3%81%93%E3%81%AE%E6%9D%A1%E4%BB%B6%E3%81%A7%E6%A4%9C%E7%B4%A2&csp=search_add&feadvns_max_line_1=6&fe_form_no=1'

charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

table = doc.css('table')
tr = table.css('tr')
tr.each do |product|
  url = product.css('a')
  p product.css('p').text
  p url.first[:href] unless url.empty?
end
