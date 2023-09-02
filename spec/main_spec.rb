require 'pry-byebug'
require 'rspec'

require_relative '../main'

RSpec.describe Main, '#call' do
  it 'works' do
    expect(Main.new.call('input')).to eq('input')
  end
end
