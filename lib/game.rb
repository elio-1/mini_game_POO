require 'bundler'
Bundler.require

require_relative 'lib/player'

def Game
  attr_accessor :human_player, :ennemies, :total_ennemies
  def initialize(name, bots, total_of_bots)
  @human_player = HumanPlayer.new(name)
  @bots_left    = total_of_ennemies
  total_of_ennemies.times do |i|
    @ennemies  << Player.new("José_#{rand(10..100)}")
  end
end
  
  def kill_player(player)                         # Remove a bot from the @enemies array
    @enemies.delete(player)
    @bots_left -= 1
  end
  
  
  def is_still_ongoing?                           # Return true if they are ennemies left
    human_player.health > 0 && !@bots_left.empty?
  end
  
  
  
end
