require 'rails_helper'

feature "user views a TV show's details", %Q{
  As a site visitor
  I want to view the details for a TV show
  So I can find learn more about it
  I can see a the show's title, network, the years it ran, and a synopsis.
} do

  # Acceptance Criteria:
  # * I can see a the show's title, network, the years it ran,
  # and a synopsis.

  scenario "user views a TV show's details" do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO' )

    visit "/television_shows/#{show.id}"

    expect(page).to have_content show.title
    expect(page).to have_content show.network
    expect(page).to have_content show.years
    expect(page).to have_content show.synopsis
  end


  scenario "user views a TV show's charcterss" do
    show = TelevisionShow.create(title: 'Game of Thrones',
      network: 'HBO', id: 2 )

    character = Character.create(name: 'Eddard Stark', actor_name: 'Sean Bean', description: 'A decent man in an indecent time.', show_id: 2)

    visit "/television_shows/#{show.id}"

    expect(page).to have_content character.name
    expect(page).to have_content character.actor_name
    expect(page).to have_content character.description

  end

end
