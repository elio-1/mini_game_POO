class Player                         # create player class
  attr_accessor :name, :health       # Define player's attribute                   
  @@players = []                     # Create a class variable 
  def initialize(name)               # Initialize the function  
    @name   = name                     # attribute player's name to the var @name
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
    
  end
  
  def attacks(player)                 # attack a player
    damage_taken = compute_damage
    player.get_damage(damage_taken) # compute damage taken by the player
    puts "#{self.name} attacks #{player.name} !"
    puts ">#{self.name} inflict #{damage_taken} damage(s).<"
    
  end
  
  def compute_damage
    return rand(1..6)
  end
end                                   # end of the player class

class HumanPlayer < Player            #child of the Player class
  attr_accessor :weapon_level, :health
  
  def initialize(name)
  @name         = name
  @weapon_level = 1                   # new variable, weapon level
  @health       = 100                 # cheater !
  end
  
  def player_state
    if @health <= 0
      puts "You are dead !"
    else
      puts "You have #{@health} health points left, your weapon is currently level #{@weapon_level}."
    end
  end
  
  def compute_damage                  # new method for player damage
    rand(1..6) * @weapon_level
  end
  
  def search_weapon                   # Human Player will search for a weapon 
    randomize = rand(1..6)
    if randomize > @weapon_level
      @weapon_level = randomize
      puts "Hurray ! You found a level #{randomize} weapon !"
    else
      puts "You haven't found anything usefull, better luck next time !"
    end
  end
  
  def search_health_pack              # Human will search for health pack
    randomize = rand(1..6)
    if randomize == 1
      puts "You haven't found anything usefull, better luck next time !"
    elsif randomize == 6
      puts "How lucky ! You found a +80hp health pack !"
      @health += 80
    else
      puts "You found a +50hp health pack !"
      @health += 50
    end
    if @health > 100
      @health = 100
    end
  end
end                                    # End of the Human Player class
