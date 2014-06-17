require 'rails_helper'

feature 'user adds a new character', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do


  scenario 'user adds a new character' do

    show = TelevisionShow.create(title: 'Terribleness', id: 3, network: 'BBC')

    character = Character.new(name: 'Austin Powers', show_id: 3)

    visit '/characters/new'
    fill_in 'Name', with: character.name
    select(show.title, :from => :character_show_id)
    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.name
    expect(page).to_not have_content character.show_id
  end

  scenario 'without required attributes' do
    visit '/characters/new'
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end

  scenario 'user cannot add a character that is already in the database' do

    show = TelevisionShow.create(title: 'Terribleness', id: 3, network: 'BBC')

    attrs = {
      name: 'Austin Powers',
      show_id: 3
    }

    old_character = Character.create(attrs)

    visit '/characters/new'
    fill_in 'Name', with: old_character.name
    select(show.title, :from => :character_show_id)
    click_on 'Submit'

    character = Character.create(attrs)

    visit '/characters/new'
    fill_in 'Name', with: character.name
    select(show.title, :from => :character_show_id)
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "already exists"
  end
end
