require 'rails_helper'

RSpec.describe 'Consoles requests' do
  before do
    Console.create(name: 'NES', manufacturer: 'Nintendo')
    Console.create(name: 'SNES', manufacturer: 'Nintendo')
    Console.create(name: 'Wii', manufacturer: 'Nintendo')
    Console.create(name: 'Genesis', manufacturer: 'Sega')
    Console.create(name: 'Xbox', manufacturer: 'Microsoft')
    Console.create(name: 'Switch', manufacturer: 'Nintendo')
    Console.create(name: 'PS1', manufacturer: 'Sony')
    Console.create(name: 'PS2', manufacturer: 'Sony')
  end

  describe 'GET /consoles' do
    it 'returns an array of video games consoles' do
      get '/consoles'
      expect(response_json['consoles']).to contain_exactly(
        'Nintendo NES',
        'Nintendo SNES',
        'Nintendo Wii',
        'Sega Genesis',
        'Microsoft Xbox',
        'Nintendo Switch',
        'Sony PS1',
        'Sony PS2'
      )
    end

    it 'supports specifying consoles for a specifuc manufacturer' do
      get '/consoles', params: { manufacturer: 'Nintendo' }
      expect(response_json['consoles']).to contain_exactly(
        'Nintendo NES',
        'Nintendo SNES',
        'Nintendo Wii',
        'Nintendo Switch'
      )
    end
  end
end
