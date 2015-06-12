require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app == Sinatra::Application
set(:show_exceptions, false)

describe('add a new museum form the index page', {:type => :feature}) do
  it('adds a new museum and refreshes the index page') do
    visit('/')
    fill_in('Add a Museum to the List', :with => 'the')
    click_button('Send')
    expect(page).to have_content("the")
  end
end
