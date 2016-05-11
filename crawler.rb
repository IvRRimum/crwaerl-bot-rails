# To find how to do stuff, google "Capybara sceatsheet"

require 'pry'
require 'jsoner'
require './poltergeist.rb'

class ExampleCrawler < PoltergeistCrawler
  def crawl
    visit "https://enreg.reestri.gov.ge/"
    click_on "მონაწილეებით ძებნა"
    fill_in "s_participants_idnumber", with: "01030031175" # The first part is the ID of element
    page.find("#s_participants_form .submit_div .submit_button").click

    sleep 5 # Give time for javascript to do its job

    data = page.find("#content")['innerHTML']
    Jsoner.parse(data)
  end
end

puts ExampleCrawler.new.crawl
