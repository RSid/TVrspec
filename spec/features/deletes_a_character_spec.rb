require 'rails_helper'

feature "user deletes a character", %Q{
  As a site visitor
I want to delete a character I don't like
So no one else will want to watch that character
} do

  scenario "user deletes a character" do
    show = TelevisionShow.create(title: 'Terribleness', id: 3, network: 'BBC')

    attrs = {
      name: 'Austin Powers',
      actor_name: 'Mike Meyers',
      description: 'cheesey spy',
      show_id: 3
    }

    character = Character.create(attrs)

    visit '/characters/new'
    fill_in 'Name', with: character.name
    fill_in 'Actor name', with: character.actor_name
    fill_in 'Description', with: character.description
    select(show.title, :from => :character_show_id)
    click_on 'Submit'


    visit '/characters'
    save_and_open_page
    select(character.name, :from => :character_id)
    click_on 'Submit'

    expect(page).to_not have_content character.name
    expect(page).to_not have_content character.actor_name
    expect(page).to_not have_content character.description
  end


end
