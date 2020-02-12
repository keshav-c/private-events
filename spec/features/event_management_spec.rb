require 'rails_helper'

RSpec.describe 'Event Management', type: :feature do
  before do
    @user1 = User.create(name: "User 1")
    @user2 = User.create(name: "User 2")
    @event2 = @user2.events.create(name: "U2 Host")
    @tnow = Time.zone.now.to_s
    @tpast = 1.hour.ago.to_s
    @tfut = 1.hour.from_now.to_s
  end
  
  it 'shows past events created by user in their profile' do
    event = @user1.events.create(name: "U1 Host", time: @tnow)
    visit root_url
    click_on 'Login'
    fill_in 'Name', with: 'User 1'
    click_button 'Login'
    expect(page).to have_content("Past")
    expect(page).to have_content("#{event.name} @ #{@tnow.to_s}")
    expect(page).not_to have_content("Upcoming")
    expect(page).not_to have_content("Attended Events")
  end

  it 'shows future events created by user in their profile' do
    event = @user1.events.create(name: "U1 Host", time: @tfut)
    visit root_url
    click_on 'Login'
    fill_in 'Name', with: 'User 1'
    click_button 'Login'
    expect(page).to have_content("Upcoming")
    expect(page).to have_content("#{event.name} @ #{@tfut.to_s}")
    expect(page).not_to have_content("Past")
    expect(page).not_to have_content("Attended Events")
  end

  it 'does not show events created by another user in profile' do
    u2_event = @user2.events.create(name: "U2 Host", time: @tnow)
    visit root_url
    click_on 'Login'
    fill_in 'Name', with: 'User 1'
    click_button 'Login'
    expect(page).not_to have_content("#{u2_event.name} @ #{@tnow.to_s}")
  end

  it 'shows all events in the index page' do
    e1 = @user1.events.create(name: "U1 Host", time: @tnow)
    e2 = @user2.events.create(name: "U2 Host", time: @tpast)
    visit events_url
    expect(page).to have_content("#{e1.name} on #{@tnow.to_s}. Hosted by #{e1.creator.name}")
    expect(page).to have_content("#{e2.name} on #{@tpast.to_s}. Hosted by #{e2.creator.name}")
  end
end