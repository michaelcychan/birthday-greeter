# ./spec/features/message_spec.rb

feature 'Message Page' do
  scenario 'Greeting Happy Birthday' do
    fill_in_name
    select("June", :from => "month:")
    select("06", :from => "day")
    click_button "Go!"
    expect(page).to have_content "Happy Birthday Boris!"
  end

  scenario 'Counting Birthday this year' do
    fill_in_name
    select("June", :from => "month")
    select("08", :from => "day")
    click_button "Go!"
    expect(page).to have_content "Your birthday will be in 2 days, Boris!"
  end

  scenario 'Counting Birthday next year' do
    fill_in_name
    select("June", :from => "month")
    select("05", :from => "day")
    click_button "Go!"
    expect(page).to have_content "Your birthday will be in 364 days, Boris!"
  end
end