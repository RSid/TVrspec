require 'rails_helper'

feature 'user views list of characters', %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch

} do

  # Acceptance Criteria:
  # * I can see a list of all the characters

  scenario 'user views characters' do
    characters = []
    character_attrs = [
      { name: 'John Drake', show_id: 1 },
      { name: 'James Bond', show_id: 2 }
    ]

    character_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit '/characters'
    characters.each do |character|
      expect(page).to have_content character.name
      expect(page).to have_content character.show_id
    end
  end
end
