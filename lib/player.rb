class Player                         # create player class
  attr_accessor :name, :health       # Define player's attribute                   
  @@players = []                     # Create a class variable 
  def initialize(name)               # Initialize the function  
    @name = name                     # attribute player's name to the var @name
    @health = 10                     # Set basic life points to 10
    @@players << self                # add new player to class variable @@players
  end
  
  def player_state                   # player current health state 
    if @health <= 0
      puts "#{@name} is dead !"
    else
      puts "#{@name} has #{@health} health points left."
    end
  end
  
  def show_state                      # all players current health state 
    @@players.each do |player|  
      player.player_state
    end
  end
  
  def get_damage(damage)
    @health -= damage                 # soustract current player heatlh by the damage he takes    
    puts ">#{self.name} inflict #{damage} damage(s).<"
  end
  
  def attacks(player)                 # attack a player
    player.get_damage(compute_damage) # compute damage taken by the player
    puts "#{self.name} attacks #{player.name} !"
    
    
  end
  
  def compute_damage
    return rand(1..6)
  end
end                                   # end of the player class
