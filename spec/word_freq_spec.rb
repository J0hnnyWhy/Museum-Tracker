require('rspec')
require('word_freq')

describe('String#word_freq') do
  it("takes the users string and splits it into individual words that are pushed into a hash")
    expect(("the the").word_freq()).to(eq("the" "the"))
  end
end
