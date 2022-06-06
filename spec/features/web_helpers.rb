# spec/features/web_helpers.rb

def fill_in_name
  visit('/')
  fill_in :name, with: "Boris"
end