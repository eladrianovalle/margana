# require 'rspec'
# require_relative '../anagram.rb'
require 'spec_helper'

describe "Our Anagrams Algorithm" do
  include SpecHelper

describe "#find_anagrams" do
  let(:word) { "abc" }

  it "takes a string" do
    expect {
      find_anagrams(word)
    }.not_to raise_error
  end

  it "returns an array" do
    expect(find_anagrams(word)).to be_a(Array)
  end

  it "returns the correct results" do
    expect(find_anagrams(word)).to eq(
      %w(abc acb bac bca cab cba)
    )
  end
end
end