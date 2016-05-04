feature 'Viewing links' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end

feature 'creating links' do
  scenario 'submits a new link' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'http://www.google.com'
    click_button 'submit'

    expect(current_path).to eq '/links'
    
    within 'ul#links' do
      expect(page).to have_content 'Title: Google URL: http://www.google.com'
    end
  end
end
