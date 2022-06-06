# ./spec/features/landing_page_spec.rb

feature 'Landing Page' do
  scenario 'Asking information' do
    visit('/')
    expect(page).to have_content "Hello there!"
    expect(page).to have_content "What's your name?"
    expect(page).to have_content "When's your birthday?"
  end
end