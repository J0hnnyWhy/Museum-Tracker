require('capybara/rspec')
require('./app')
Capybara.app == Sinatra::Application

describe('path for word_freq', {:type => :feature}) do
  it('processes the user entry to find how many times their word is in the string') do
    visit('/')
    fill_in('string_one', :with => 'the')
    fill_in('string_two', :with => 'the cat the dog')
    click_button('Send')
    expect(page).to have_content(2)
  end
end
