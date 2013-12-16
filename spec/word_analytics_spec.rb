require 'rspec'
require_relative '../lib/word_analytics.rb'

describe WordAnalytics do

  it 'should count each word' do
    w= WordAnalytics.new('Hello! Hello! My name is Koa. I am Koa!')
    expect(w.word_frequency).to eql({"hello"=>2, "my"=>1, "name"=>1, "is"=>1, "koa"=>2, "i"=>1, "am"=>1})
  end

  it 'should count each letter' do
    w= WordAnalytics.new('Hello! Hello! My name is Koa. I am Koa!')
    expect(w.letter_frequency).to eql({"h"=>2, "e"=>3, "l"=>4, "o"=>4, "m"=>3, "y"=>1, "n"=>1, "a"=>4, "i"=>2, "s"=>1, "k"=>2})
  end

  it 'should count each symbol (any non-letter and non-digit character, excluding white space)' do
    w= WordAnalytics.new('Hello! 123. Hello! My name is Koa. I am Koa!! ?$##@')
    expect(w.symbol_frequency).to eql({"!"=>4, "."=>2, "?"=>1, "$"=>1, "#"=>2, "@"=>1})
  end

  it 'should show top three most common words' do
    w= WordAnalytics.new('Hello! Hello! My name is Koa. I am Koa!')
    expect(w.three_most_common_words).to eql([["hello", 2], ["my", 1], ["name", 1]])
  end

  it 'should show top three most common letters' do
    w= WordAnalytics.new('Hello! Hello! My name is Koa. I am Koa!')
    expect(w.three_most_common_letters).to eql([["a", 4], ["e", 3], ["h", 2]])
  end
end



