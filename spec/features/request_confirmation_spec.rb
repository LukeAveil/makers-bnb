feature 'User can approve requests' do

  scenario 'Can see pending requests', js: true do
    makeRequest
    expect(page).to have_content("Luke's place")
  end

  scenario 'Can approve request', js: true do
    makeRequest
    click_button "Approve"
    expect(Request.first.confirmed).to eq 2
  end

end
