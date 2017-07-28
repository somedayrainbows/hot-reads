require 'rails_helper'

RSpec.feature 'as a user' do
  scenario 'i can see the top ten most-read links' do
    Link.create(url: 'http://google.com', total_reads: 10)
    Link.create(url: 'http://tripadvisor.com', total_reads: 9)
    Link.create(url: 'http://travel.com', total_reads: 8)
    Link.create(url: 'http://airbnb.com', total_reads: 7)
    Link.create(url: 'http://bofa.com', total_reads: 13)
    Link.create(url: 'http://united.com', total_reads: 4)
    Link.create(url: 'http://reddit.com', total_reads: 2)
    Link.create(url: 'http://gmail.com', total_reads: 16)
    Link.create(url: 'http://twitter.com', total_reads: 12)
    Link.create(url: 'http://apple.com', total_reads: 6)

    visit root_path

    expect(page).to have_content('Hot Reads!')

    within('.hot-links') do
      expect(page).to have_content('1: http://gmail.com')
      expect(page).to have_content('2: http://bofa.com')
      expect(page).to have_content('3: http://twitter.com')
      expect(page).to have_content('4: http://google.com')
      expect(page).to have_content('5: http://tripadvisor.com')
      expect(page).to have_content('6: http://travel.com')
      expect(page).to have_content('7: http://airbnb.com')
      expect(page).to have_content('8: http://apple.com')
      expect(page).to have_content('9: http://united.com')
      expect(page).to have_content('10: http://reddit.com')
      expect(page).to_not have_content('http://hello.com')
      expect(page).to_not have_content('http://whales.com')
    end
  end
end
