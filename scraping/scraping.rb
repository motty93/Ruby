require 'nokogiri'
require 'open-uri'

url = 'url'
charset = nil

begin
  html = open(url) do |f|
    charset = f.charset
    f.read
  end
rescue
  puts 'BadRequest 404'
end


def grep(doc, text)
  node = doc.css("//span[@class='a-list-item']").grep(/#{text}/)
  return if node.empty?

  /:/ =~ node.first.children.text
  $'
end

doc = Nokogiri::HTML.parse(html, nil, charset)
# puts grep(doc, '文字列')
