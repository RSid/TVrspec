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
      { name: 'John Drake', actor_name: 'Patrick McGoohan', description: 'Jaded spy', show_id: 1 },
      { name: 'James Bond', actor_name: 'Sean Connery', description: 'suave-sleazy spy', show_id: 2 }
    ]

    show_attrs = [
      { title: 'Danger Man', id: 1, network: 'BBC'},
      { title: '007', id: 2, network: 'BBC'}
    ]

    shows = []
    show_attrs.each do |attrs|
      shows << TelevisionShow.create(attrs)
    end

    character_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit '/characters'
    characters.each do |character|
      expect(page).to have_content character.name
      expect(page).to have_content TelevisionShow.find(character.show_id).title
    end
  end
end
