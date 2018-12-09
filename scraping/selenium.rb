require 'selenium-webdriver'
require 'nokogiri'
require 'pry'

ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
# caps = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { binary: '/usr/bin/google-chrome-stable', args: ['--headless', '--disable-gpu', "--user-agent=#{ua}", 'window-size=1280*800']})
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
options.add_argument('--disable-gpu')
options.add_argument("--user-agent=#{ua}")
driver = Selenium::WebDriver.for :chrome, options: options
driver.get 'https://www.amazon.co.jp/gp/offer-listing/B07HC15QNZ/ref=dp_olp_new?ie=UTF8&condition=new'
sleep(4)

# find_elementで単数取得
seller_info = driver.find_elements(:xpath, "//h3[@class='a-spacing-none olpSellerName']/span/a")
pagination = driver.find_elements(:xpath, "//ul[@class='a-pagination']/li/a").map { |el| el.attribute(:href) }

# ページネーションがないページ
# driver.get 'https://www.amazon.co.jp/gp/offer-listing/B073PY47QP/ref=dp_olp_new?ie=UTF8&condition=new'

# loop.with_index(1) do |_, i|
#   puts "==================================#{i}回目==================================="
#   puts driver.find_elements(:xpath, "//h3[@class='a-spacing-none olpSellerName']").map(&:text)
#   break if driver.find_elements(:xpath, "//ul[@class='a-pagination']/li/a").last[-1] == '#'
#
#   driver.find_elements(:xpath, "//ul[@class='a-pagination']/li/a").last.click
#   sleep(3)
# end

# 二回目のget urlも問題なさそう
driver.get 'https://www.amazon.co.jp/sp?_encoding=UTF8&seller=A2W8UAZHGIMLV7'

driver.close

