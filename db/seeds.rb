User.create!(username: 'player0ne', password: 'p@ssw0rd')

Game.create!(name: 'Tic-Tac-Toe')
Game.create!(name: 'Spin the Wheel')
Game.create!(name: 'Minesweeper')

Achievement.create!(name: '3 in a row', criteria: 1)
Achievement.create!(name: 'Big gainer', criteria: 2)
Achievement.create!(name: 'Explorer', criteria: 3)
