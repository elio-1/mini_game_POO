require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
binding.pry
player1 = Player.new("José")
player2 = Player.new("Josiane")
puts "Current players states: "
puts player1.player_state
p player2.player_state
puts "FIGHT !"
while player1.health > 0 && player2.health > 0 do
  if player2.health <= 0 || player1.health <= 0 
    break
  else
  puts "Attack phase:"
  player2.attacks(player1)
  player1.attacks(player2)
  puts
  puts "Player state:"
  puts
  puts player1.player_state
  puts player2.player_state
  puts "------------"
  end
end

