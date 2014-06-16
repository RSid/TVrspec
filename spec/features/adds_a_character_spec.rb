# require 'rails_helper'

# feature 'user adds a new TV show', %Q{
#   As a site visitor
#   I want to add my favorite TV show characters
#   So that other people can enjoy their crazy antics
# } do


#   scenario 'user adds a new character' do
#     attrs = {
#       name: 'Austin Powers',
#       show_id: 2
#           }

#     character = Character.new(attrs)

#     visit '/characters/new'
#     fill_in 'Name', with: character.title
#     fill_in 'Show_id', with: character.show_id
#     click_on 'Submit'

#     expect(page).to have_content 'Success'
#     expect(page).to have_content character.name
#     expect(page).to_not have_content character.show_id
#   end

#   scenario 'without required attributes' do
#     visit '/characters/new'
#     click_on 'Submit'

#     expect(page).to_not have_content 'Success'
#     expect(page).to have_content "can't be blank"
#   end

#   scenario 'user cannot add a character that is already in the database' do
#     attrs = {
#       name: 'Austin Powers',
#       show_id: 2
#     }

#     character = Character.create(attrs)

#     visit '/characters/new'
#     fill_in 'Name', with: character.name
#     fill_in 'Show_id', with: character.id
#     click_on 'Submit'

#     expect(page).to_not have_content 'Success'
#     expect(page).to have_content "has already been taken"
#   end
# end