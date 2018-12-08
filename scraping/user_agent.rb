require 'selenium-webdriver'
require 'webdriver-user-agent'

# driver = Webdriver::UserAgent.driver(:browser => :safari, :agent => :random, :orientation => :landscape)
# OSに専用のbrowser用のパッケージが必要(ubuntu chrome => sudo apt install chromium-chromedriver)
30.times do
  driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :random, :orientation => :landscape)
  puts driver.execute_script('return navigator.userAgent')
end
