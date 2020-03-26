#gems

require "tty-box"
require "tty-prompt"

# Personality hashes

$cutesy = {
    :selected => "*bats eyelids* you're too kind to me",
    :flirt => ["HEHE, your eyes are like boba tea!", "Daww hun, you're doing GWATE!", "UwU, you so cute, I wanna boop your shnoz"],
    :frequently => "Hey bb, how frequently do you want me to remind you of this?",
    :water => "Drink some water to keep your cheeks plush and red!",
    :symptom => ["Hey cutie-pie, do you have a dry cough :*(", "Do you maybe have a lil bit fever?", "Muffin, remember a sore through may mean you have the Wuhan Sniffles"],
    :stretch => "Gotta keep those armsies and legsies limber, keep that back limber for the pikachu dance routine we're doing after work!"
}

$stern = {
    :selected => "Good. Why would you want any of those other hussies",
    :flirt => ["Get back to work", "Please work harder", "Get covid-19 already"],
    :frequently => "The frequency of which I need to remind you should be HIGH, make it high, or else.",
    :water => "You better drink some water or I will make water flow from your eyes",
    :symptom => ["That sounded like a cough? Was that a cough?", "I see you sweating (◔_◔) - do you have a fever?", "Remember, a sore throat could mean you've got the WuFlu"],
    :stretch => "Stretch now, do it now, not later, STRETCH NOW, or you're cut off."
}

$relaxed = {
    :selected => "Thanks! But it was totally cool if you chose one of the others",
    :flirt => ["Hey bb you make me want to stay in bed all day", "Those trackies are pretty sweet lookin' on you.", "I'm a fan of lying in bed next to you."],
    :frequently => "How often do you want me to remind you? Just don't make it too often.",
    :water => "Hydrations cool, would reccomend, but it's your life.",
    :symptom => ["Hey like, do you reckon you have a dry cough or whatever?", "Not that it really matters but, if you've got a fever, speak up", "Man, sometimes my throat is a bit sore. Is yours?"],
    :stretch => "Hey like, maybe if you wanted to, like... Probably do some stretches hey."
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
    puts "Drink water, take a break and stretch those humanoid decaying muscles"
    sleep(5)
    system "clear"
    puts "And to stretch those slowly decaying humanoid muscles"
    sleep(6)
    system "clear"
    puts "Karona can also check your symptoms for COVID-19 and play games with you"
    sleep(5)
    system "clear"
    puts "And best of all...."
    sleep(4)
    system "clear"
    puts "Karona will flirt with you, during the long lonely nights."
    sleep(5)
    system "clear"
    puts "Anything is possible when you have Karona!"
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
        $selected = "stern"
        return $stern[:selected]
    elsif personality_picker == "Cutesy-Pie"
        $selected = "cutesy"
        return $cutesy[:selected]
    elsif personality_picker == "Relaxed"
        $selected = "relaxed"
        return $relaxed[:selected]
    end
    main_menu()
end

# Main Menu 
def main_menu()
prompt = TTY::Prompt.new 
menu_choice = prompt.select("What would you like to do", ["Focus on work", "Check Symptoms", "Flirt", "Play a game", "Exit"])
    if menu_choice =="Focus on work"
        focus_on_work()
    elsif menu_choice == "Check Symptoms"
        return 
    elsif menu_choice == "Flirt"
        return $selected[:flirt][rand(3)]
    elsif menu_choice == "Play a game"
        return 
    elsif menu_choice == "Exit"
        puts "clear"
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
    puts $selected[:water]
    sleep(5)
    system "clear"
    # Waits 10 mins then reminds the user to stretch
    sleep(3)
    system "clear"
    # Add sound?
    puts $selected[:stretch]
    sleep(5)
    system "clear"
    # Waits 10 mins then reminds the user to stretch
    sleep(3)
    system "clear"
    # Add sound?
    puts $selected[:water]
    sleep(5)
    system "clear"
    # Waits 20 mins then returns to main menu for a break
    sleep(3)
    main_menu()      
end

def check_symptoms
    x = ""
    puts $selected[:symptom][rand(3)]
    puts "Answer: Yes/No"
    x =  gets.chomp  
    if x.downcase == "yes"
        puts "Self isolate for 14 days, and if symptoms become worse please see your local medical professional"
    elsif x.downcase == "no"
        puts "Keep staying at home regardless, we're in lockdown! Even if you miss Mike & Bruce :("
    else
        puts "Please answer yes or no... It's a simple question"
    end
end

system "clear"

# welcome_message()

# user_name()

# personality_choices()

# main_menu()

focus_on_work()

