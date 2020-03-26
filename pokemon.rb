################# REQUIRING/SETUP GEMS #################

require 'colorize'
require 'tty-prompt'
require 'tty-box'
require 'tty-font'
font = TTY::Font.new(:starwars)
prompt = TTY::Prompt.new

################# NEW POKEMON CLASS #################

class Pokemon
    attr_accessor :name, :level, :attacks, :element, :health

    def initialize(name, level, attacks, element)
        @name = name
        @level = level
        @attacks = attacks
        @element = element
        @health = 10 * (@level * 3)
    end

end



########### Function which creates specific dialouge once user has chosen pokemon ######################################

def pokemon_opening_line(name) 
    case name
    when "Pikachu"
        return "May your lightning strike fear into the heart of all mortals! HA!"
    when "Bulbasaur"
        return "May you make like a mighty tree, and leaf!.. your oponents ruined on the battlefield... HA!"
    when "Charmander"
        return "May you burn them, BURN THEM ALLLLL HA!"
    when "Squirtle"
        return "May your water hydrate death! So he can carry out his duties on your foes! HA!"
    end
end

########### Function which randomizes a pokemon for the computer #########################################################################

def randomize_ai_pokemon(arr)
    arr[rand(arr.length)]
end

#################### BEGIN APPLICATION RUN ###############################################################################################

play_again = true
puts font.write("         Pokemon")
box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15]) do
    "Welcome to the Pokémon Stadium, where the fiercest trainers do battle! HA!"
end
print box

while play_again == true
    play_again = nil
    
################# Colorize workaround, was manipulating string output, so mapped those to what it should be ###############################

    colorize_map = {
        "\e[0;31;49mCharmander\e[0m" => "Charmander",
        "\e[0;33;49mPikachu\e[0m" => "Pikachu",
        "\e[0;32;49mBulbasaur\e[0m" => "Bulbasaur",
        "\e[0;34;49mSquirtle\e[0m" => "Squirtle"
    }

    def colorize_fix(colorize_map, player_choice)
        p colorize_map[player_choice]
    end

################# POKEMON INSTANCES + ARRAY #############################################################################################

    pikachu = Pokemon.new("Pikachu", 7, {"Quick Attack" => 90, "Thundershock" => 110, "Thunderwave" => 100}, "Electric")
    charmander = Pokemon.new("Charmander", 5, {"Scratch" => 40, "Ember" => 50, "Fire Fang" => 35}, "Fire")
    bulbasaur = Pokemon.new("Bulbasaur", 8, {"Vine Whip" => 110, "Razor Leaf" => 100, "Ram" => 60}, "Leaf")
    squirtle = Pokemon.new("Squirtle", 10, {"Bubble" => 110, "Tackle" => 60, "Water Gun" => 140}, "Leaf")
    pokemon_array = [pikachu, charmander, bulbasaur, squirtle]

################# Pokemon choice ###################################################################################

    choices = [pikachu.name.colorize(:yellow), charmander.name.colorize(:red), bulbasaur.name.colorize(:green), squirtle.name.colorize(:blue)]
    user_selection = prompt.select("Choose your pokemon!", choices)
    user_selection = colorize_fix(colorize_map, user_selection)
    box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15]) do
        "You have chosen #{user_selection}! #{pokemon_opening_line(user_selection)}"
    end
    print box

################# Instance loaded into player variable ###################################################################################

    case user_selection
    when "Pikachu"
        player_pokemon = pikachu
        pokemon_array.delete(pikachu)
    when "Bulbasaur"
        player_pokemon = bulbasaur
        pokemon_array.delete(bulbasaur)
    when "Charmander"
        player_pokemon = charmander
        pokemon_array.delete(charmander)
    when "Squirtle"
        player_pokemon = squirtle
        pokemon_array.delete(squirtle)
    end

################# Instance loaded into ai variable ######################################################################################

    ai_pokemon = randomize_ai_pokemon(pokemon_array)
    box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15]) do
        "The enemy trainer has chosen #{ai_pokemon.name}!"
    end
    print box

################# Battle cycle ##########################################################################################################

    player_turn = true
    pokemon_is_defeated = false
    while pokemon_is_defeated == false
        if player_turn == true

            curr_choice = player_pokemon.attacks
            curr_player_attack = prompt.select("It's your turn young Master Trainer! Attack!", curr_choice)
            ai_pokemon.health -= curr_player_attack
            # Tests to see if ai pokemon is dead, if not run as usual, otherwise end cycle
            if ai_pokemon.health <= 0
                box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15], title: {top_left: "  #{player_pokemon.name}  "}) do
                    "#{player_pokemon.name} uses #{player_pokemon.attacks.key(curr_player_attack)}. Enemies health is now 0! You have defeated the enemy's #{ai_pokemon.name}, congratulations Master trainer! HA!"
                end
                print box
                pokemon_is_defeated = true
            else
                box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15], title: {top_left: "  #{player_pokemon.name}  "}) do
                    "#{player_pokemon.name} uses #{player_pokemon.attacks.key(curr_player_attack)}. Hits the opponents #{ai_pokemon.name} for #{curr_player_attack} damage. #{ai_pokemon.name}'s health is now #{ai_pokemon.health}"
                end
                print box
            end
            player_turn = false

        else player_turn == false

            curr_ai_attack = ai_pokemon.attacks.keys[rand(ai_pokemon.attacks.keys.length - 1)]
            player_pokemon.health -= ai_pokemon.attacks[curr_ai_attack]
            puts "                                                                 "
            # Tests to see if player pokemon is dead, if not run as usual, otherwise end cycle
            if player_pokemon.health <= 0
                box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15], title: {top_left: "  #{ai_pokemon.name}  "}) do
                    "#{ai_pokemon.name} uses #{curr_ai_attack}. Your health is now 0! You have been defeated by the enemy's #{ai_pokemon.name}, you have much to learn young trainer! HA!"
                end
                print box
                pokemon_is_defeated = true
            else
                box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15], title: {top_left: "  #{ai_pokemon.name}  "}) do
                    "#{ai_pokemon.name} hits your #{player_pokemon.name} for #{ai_pokemon.attacks[curr_ai_attack]} damage. #{player_pokemon.name}'s health is now #{player_pokemon.health}"
                end
                print box
            end
            player_turn = true

        end
    end

################# Play again test ##########################################################################################################

    box = TTY::Box.frame(width: 90, height: 8, border: :light,  align: :center, padding: [2, 15]) do
        "Care to do battle once more Master Trainer? (y/n) After typing, hit enter."
    end
    print box
    
    while play_again == nil
        answer = gets.chomp
        if answer.downcase == "y" || answer.downcase == "yes"
            play_again = true
        elsif answer.downcase == "n" || answer.downcase == "no"
            puts "You will be missed from the Pokémon arena Master trainer, return any time for EPIC POKÉMON BATTLES!!!"
            play_again = false
        else
            puts "please answer yes (y) or no (n), then hit enter."
        end
    end
end

