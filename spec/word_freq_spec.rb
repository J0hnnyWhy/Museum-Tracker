require('rspec')
require "pry"
require('xxxxxxx')
require "capybara/rspec"
require "./app"
Capybara.app = Sinatra::Application

describe('String') do
  before() do
    .clear()
  end

  describe('#') do
  it("") do
    expect(("the the").word_freq()).to(eq("the" "the"))
  end
end
end
