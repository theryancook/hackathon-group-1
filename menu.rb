#gems
require "tty-box"
require "tty-prompt"


# Games

require_relative "./kahoot.rb"
require_relative "./qanda.rb"
# require_relative "./pokemon.rb"

# Personality hashes

$personality_hashes = {
    "cutesy" => {
        :selected => "*bats eyelids* you're too kind to me",
        :flirt => ["HEHE, your eyes are like boba tea!", "Daww hun, you're doing GWATE!", "UwU, you so cute, I wanna boop your shnoz"],
        :frequently => "Hey bb, how frequently do you want me to remind you of this?",
        :water => "Drink some water to keep your cheeks plush and red!",
        :symptom => ["Hey cutie-pie, do you have a dry cough :*(", "Do you maybe have a lil bit fever?", "Muffin, remember a sore through may mean you have the Wuhan Sniffles"],
        :stretch => "Gotta keep those armsies and legsies limber, keep that back limber for the pikachu dance routine we're doing after work!",
        :work_done => "You're such a good worker! You've just finished an hour"
    },
    "stern" => {
        :selected => "Good. Why would you want any of those other options",
        :flirt => ["Get back to work", "Please work harder", "Get covid-19 already"],
        :frequently => "The frequency of which I need to remind you should be HIGH, make it high, or else.",
        :water => "You better drink some water or I will make water flow from your eyes",
        :symptom => ["That sounded like a cough? Was that a cough?", "I see you sweating (◔_◔) - do you have a fever?", "Remember, a sore throat could mean you've got the WuFlu"],
        :stretch => "Stretch now, do it now, not later, STRETCH NOW, or you're cut off.",
        :work_done => "Finally you've finished, now start again for MAXIMUM EFFORT"
    },
    "relaxed" => {
        :selected => "Thanks! But it was totally cool if you chose one of the others",
        :flirt => ["Hey bb you make me want to stay in bed all day", "Those trackies are pretty sweet lookin' on you.", "I'm a fan of lying in bed next to you."],
        :frequently => "How often do you want me to remind you? Just don't make it too often.",
        :water => "Hydration's cool, would recommend, but it's your life.",
        :symptom => ["Hey like, do you reckon you have a dry cough or whatever?", "Not that it really matters but, if you've got a fever, speak up", "Man, sometimes my throat is a bit sore. Is yours?"],
        :stretch => "Hey like, maybe if you wanted to, like... Probably do some stretches hey.",
        :work_done => "I can't believe you just worked for a whole hour!"
    }
}


# Welcome message 

def love_heart()
    puts"       @@@@@@           @@@@@@"
    puts"     @@@@@@@@@@       @@@@@@@@@@"
    puts"   @@@@@@@@@@@@@@   @@@@@@@@@@@@@@"
    puts"  @@@@@@@@@@@@@@@@@ @@@@@@@@@@@@@@@@@"
    puts" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts"  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts"    @@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts"       @@@@@@@@@@@@@@@@@@@@@@@"
    puts"         @@@@@@@@@@@@@@@@@@@"
    puts"           @@@@@@@@@@@@@@@"
    puts"             @@@@@@@@@@@"
    puts"               @@@@@@@"
    puts"                 @@@"
    puts"                  @"
end

def welcome_message()
    system "clear"
    puts "Hi and welcome to Iso-relations Partner"
    sleep(5)
    system "clear"
    puts "The outbreak of a deadly virus has probably left you feeling lonely, depressed and lacking motivation"
    sleep(5)
    system "clear"
    puts "But please don't worry, we here at Coder Academy Incorporated have got you covered"
    sleep(5)
    system "clear"
    puts "Introducing to you..."
    sleep(3)
    system "clear"
    puts "Your new AI partner Karona"
    sleep(3)
    system "clear"
    puts "Karona is here to keep you sane, safe and on task."
    sleep(5)
    system "clear"
    puts "Karona has many options "
    sleep(5)
    system "clear"
    puts "Karona can keep you on task by reminding you to..."
    sleep(5)
    system "clear"
    puts "Drink water, stretch and take a break"
    sleep(5)
    system "clear"
    puts "And to stretch those slowly decaying humanoid muscles"
    sleep(6)
    system "clear"
    puts "Karona can also check your symptoms for COVID-19"
    sleep(5)
    system "clear"
    puts "Karon can even play games with you! Like Kahoot!"
    sleep(5)
    system "clear"
    puts "And best of all...."
    sleep(3)
    system "clear"
    puts "Karona is here to flirt with you, during those cold long lonely nights."
    sleep(5)
    system "clear"
    puts "Anything is possible when you have Karona!"
    sleep(3)
    system "clear"
end


# User name input
def user_name()
    puts 'Please enter the name so may start interacting with Karona'
    $name = gets.chomp.capitalize
    system "clear"
    puts "Hi #{$name}! Now you can pick a personality type for your new AI partner"
    sleep(3)
    system "clear"
end


# personality-picker
def personality_choices()
prompt = TTY::Prompt.new 
personality_picker = prompt.select("Please pick a personality type for Karona", ["Stern", "Cutesy-Pie", "Relaxed"])
    if personality_picker == "Stern"
        $selected_personality = $personality_hashes["stern"]
    elsif personality_picker == "Cutesy-Pie"
        $selected_personality = $personality_hashes["cutesy"]
    elsif personality_picker == "Relaxed"
        $selected_personality = $personality_hashes["relaxed"]
    end
    puts $selected_personality[:selected]
    sleep(3)
end

# Main Menu 
def main_menu()
system "clear"
prompt = TTY::Prompt.new 
menu_choice = prompt.select("What would you like to do", ["Focus on work", "Check Symptoms", "Flirt", "Play a game", "Exit"])
    if menu_choice =="Focus on work"
        focus_on_work()
    elsif menu_choice == "Check Symptoms"
        check_symptoms() 
    elsif menu_choice == "Flirt"
        puts $selected_personality[:flirt][rand(3)]
        sleep(3)
        main_menu()
    elsif menu_choice == "Play a game"
        # game_choice()
        kahoot_game()
        main_menu()
    elsif menu_choice == "Exit"
        system "clear"
        puts " Good-bye my lover, good-bye my friend"
        exit
    end
end

def focus_on_work
    system "clear"
    love_heart()
    # Waits 20 mins then reminds the user to drink water
    sleep(3)
    system "clear"
    # Add sound?
    puts $selected_personality[:water]
    puts "Press the enter key to continue working"
    while STDIN.getch != "\r"
        if pause == true
            puts "Press the 'enter' key to continue"
        end
        pause = !pause
        end
    system "clear"
    love_heart()
    # Waits 10 mins then reminds the user to stretch
    sleep(3)
    system "clear"
    # Add sound?
    puts $selected_personality[:stretch]
    puts "Press the enter key to continue working"
    while STDIN.getch != "\r"
        if pause == true
            puts "Press the 'enter' key to continue"
        end
        pause = !pause
        end
    system "clear"
    love_heart()
    # Waits 10 mins then reminds the user to stretch
    sleep(3)
    system "clear"
    # Add sound?
    puts $selected_personality[:water]
    puts "Press the enter key to continue working"
    while STDIN.getch != "\r"
        if pause == true
            puts "Press the 'enter' key to continue"
        end
        pause = !pause
        end
    system "clear"
    love_heart()
    # Waits 20 mins then returns to main menu for a break
    sleep(3)
    system "clear"
    puts $selected_personality[:work_done]
    puts "Press the enter key to finish working"
    while STDIN.getch != "\r"
        if pause == true
            puts "Press the 'enter' key to continue"
        end
        pause = !pause
        end
    main_menu()      
end

def check_symptoms
    x = ""
    puts $selected_personality[:symptom][rand(3)]
    puts "Answer: Yes/No"
    x =  gets.chomp  
    if x.downcase == "yes"
        puts "Self isolate for 14 days, and if symptoms become worse please see your local medical professional"
    elsif x.downcase == "no"
        puts "Keep staying at home regardless, we're in lockdown! Even if you miss Mike & Bruce :("
    else
        puts "Please answer yes or no... It's a simple question"
    end
    sleep(3)
    main_menu()
end

# def game_choice()
#     prompt = TTY::Prompt.new 
#     game_choice = prompt.select("What game would you like to play?", ["Kahoot", "Pokemon",])
#         if game_choice == "Kahoot"
#             kahoot_game()
#         elsif game_choice == "Pokemon"
#             pokemon_game()
#         else
#         end
#     main_menu()
# end




system "clear"

welcome_message()

user_name()

personality_choices()

main_menu()

# test text