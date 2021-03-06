require 'rails_helper'

RSpec.describe 'User creation and login', type: :feature do
  before do
    @user = User.create(name: 'Test User')
  end

  scenario 'valid new user' do
    visit root_url
    click_on 'Register'
    expect(page).to have_content('Sign up!')
    fill_in 'Name', with: 'Valid User'
    click_on 'Create my account'
    expect(page).to have_content('Welcome Valid User')
  end

  scenario 'invalid new user' do
    visit root_url
    click_on 'Register'
    fill_in 'Name', with: 'Test User'
    click_on 'Create my account'
    expect(page).to have_content('User already in db!')
  end

  scenario 'valid login' do
    visit root_url
    click_on 'Login'
    expect(page).to have_content('Log in')
    fill_in 'Name', with: 'Test User'
    click_button 'Login'
    expect(page).to have_content('Welcome Test User')
  end

  scenario 'invalid login' do
    visit root_url
    click_on 'Login'
    expect(page).to have_content('Log in')
    fill_in 'Name', with: 'Nonexistant User'
    click_button 'Login'
    expect(page).to have_content('User doesn\'t exist!')
  end
end
