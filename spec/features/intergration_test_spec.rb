feature 'user can select a name' do
  scenario 'user visits the site and can enter their player_one' do
    visit('/')
    expect { fill_in('player_one', with: 'Nerdpuff') }.to_not raise_error
  end

  scenario 'user submits their name and is loaded into a game with that name' do
    visit('/')
    fill_in('player_one', with: 'Nerdpuff')
    click_button('Submit')
    expect(page).to have_content('Player one: Nerdpuff')
  end
end

feature 'player one can select a move' do
  before do
    visit('/')
    fill_in('player_one', with: 'Nerdpuff')
    click_button('Submit')
  end

  scenario 'player one can click "rock"' do
    within('#p1') do
      click_button('Rock')
    end
    expect(page).to have_content('You chose rock')
  end

  scenario 'player one can click "paper"' do
    within('#p1') do
      click_button('Paper')
    end
    expect(page).to have_content('You chose paper')
  end

  scenario 'player one can click "scissors"' do
    within('#p1') do
      click_button('Scissors')
    end    
    expect(page).to have_content('You chose scissors')
  end
end

# feature 'AI is created with a random move if no player two' do
#   it 'creates a player class for "AI"' do
#     visit('/')
#     fill_in('player_one', with: 'Nerdpuff')
#     click_button('Submit')
#     expect(page).to have_content('Player two: AI')
#   end
# end

# feature 'user can win a game' do
#   scenario 'user picks rock, beats scissors' do
#     visit('/')
#     fill_in('player_one', with: 'Nerdpuff')
#     click_button('Submit')
#     expect(page).to have_content('Player one: Nerdpuff')
#     click_button('Scissors')
#     expect(page).to have_content('Rock beats scissors, Nerdpuff wins!')
#   end
# end
