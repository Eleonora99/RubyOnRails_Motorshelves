Given('I am authenticated') do
    User.create!(:id => 1, :email=>"prova@prova.com", :password => "password", :firstname => "Lorenzo", :lastname => "Blu" ,:roles_mask => 3 )
    visit "/"
    fill_in "Email", with: "prova@prova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_text("Homepage")
end

When('I follow {string}') do |string|
    click_link(string)
end

Then('I should be on the Create New Bikeadv Page') do
    current_path = URI.parse(current_url).path
    current_path == '/users/1/bikeadvs/new'
end

When('I fill in {string} with {string}') do |field, value|
    fill_in(field, :with => value)
end

When('I press {string}') do |string|
    click_button(string)
end

And('I should see {string}') do |string|
    expect(page).to have_text(string)
end

Given('Another user have created a bikeadv') do
    User.create!(:id => 2, :email=>"prova1@prova.com", :password => "password", :firstname => "Gianni", :lastname => "Rosso" ,:roles_mask => 1 )
    visit "/"
    fill_in "Email", with: "prova1@prova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_link "Create an advertisement"
    fill_in("Scuderia", :with => "BMW")
    fill_in("Modello", :with => "GS")
    fill_in("Cilindrata", :with => "R1200")
    click_button "Create"
    click_link "Homepage"
    click_link "Logout"
end

Given('I am an admin') do
    expect(page).to have_link(text:"See users profiles")
end

Given('Banned user is authenticated') do
    User.create!(:id => 3, :email=>"prova2@prova.com", :password => "password", :firstname => "Laura", :lastname => "Viola" ,:roles_mask => 0 )
    visit "/"
    fill_in "Email", with: "prova2@prova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
end

Given('I am banned') do
    expect(page).not_to have_link(text:"Create an advertisement")
    expect(page).not_to have_link(text:"Look for a new bike")
    expect(page).not_to have_link(text:"Look for a bike-seller")
    expect(page).not_to have_link(text:"Your advertisements")
end

And('I try to authenticate') do 
    fill_in "Email", with: "prova2@prova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
end

Given('I am on the Motorshelves Homepage') do
    fill_in "Email", with: "prova@prova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_text("Homepage")
end

Then ('I should be on the Bike Advertisements List Page') do
    current_path = URI.parse(current_url).path
    current_path == '/users/1/bikeadvs'
end

Given('I have created a bikeadv') do
    User.create!(:id => 1, :email=>"prova@prova.com", :password => "password", :firstname => "Lorenzo", :lastname => "Blu" ,:roles_mask => 3 )
    visit "/"
    fill_in "Email", with: "prova@prova.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_link "Create an advertisement"
    fill_in("Scuderia", :with => "BMW")
    fill_in("Modello", :with => "GS")
    fill_in("Cilindrata", :with => "R1200")
    click_button "Create"
    click_link "Homepage"
    click_link "Logout"
end

Then('I should not see my bikeadv') do
    expect(page).not_to have_text("BMW")
end

Then('I should be on the other user Bike Advertisements List Page') do
    current_path = URI.parse(current_url).path
    current_path == '/users/2/bikeadvs'
end


Then('I should be on Log In Page') do
    current_path = URI.parse(current_url).path
    current_path == '/users/sign_in'
end
