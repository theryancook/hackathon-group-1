# Gems
require "ruby_terminal_games"
require "tty-prompt"
require "timers"
timers = Timers::Group.new

=begin
================ TIME PERMITTING ===============
Add our term apps as ruby gems.
Implement graphics
================================================

Cutie-pie, Relaxed, Stern ~~ Variables for each. Potentially we could create A personality/partner Class and create 3 instances of that.
Get name from User.
Choose a personality type
Greeting screen/Intro to program "Hey lover type something"
Run down of app and what it does for you "Hi, I'm your AI partner, what would you like to..."
Present user with menu of what they'd like to do. TTY-Prompt.
--------- OPTIONS ------------
Prompt for how frequently you want to be reminded to do these things?
Drink water -- These are just on timers
Leave me alone -- Timers
Take a break
    - how long you want to take for
Stretch
    - Take through routine
Hour mark, play a game (OUR OWN TERM APPS)
    - Our ruby gems
Symptom checker for the Vid.
    - runs through symptoms list, answer each y/n
Flirting men for the el oh els. Pickup line generator/positive reinforcement ~~ PERSONALITY DEPENDENT ~~
    - Randomised sexy pickup line
=end

# class Personality
#     attr_accessor :flirt, :prompt, :take_break

#     def initialize(flirt, prompt, take_break)
#         @flirt = flirt
#         @prompt = prompt
#         @take_break = take_break
#     end

#     def flirt()
#        puts @flirt[rand(3)]
#     end

#     # def stretch()
#     #     # Run through routine
#     #     # Suggest stretch countdown timer start -> ask if they've done it y/n -> move to next stretch rinse repeat
#     # end
    
#     def prompt(type)
#         if type == "water"
#             puts @prompt[:water]
#         elsif type == "frequently"
#             puts @prompt[:frequently]
#         elsif type == "symptoms"
#             puts @prompt[:symptom][rand(2)]
#         end
#     end

#     def take_break()

#     end

# end



# Personality format: flirt = 3 options, frequently = 1 option, water = 1 option, symptom = 2 options

# cutesy = {
#     :selected => "*bats eyelids* you're too kind to me",
#     :flirt => ["HEHE, your eyes are like boba tea!", "Daww hun, you're doing GWATE!", "UwU, you so cute, I wanna boop your shnoz"],
#     :frequently => "Hey bb, how frequently do you want me to remind you of this?",
#     :water => "Drink some water to keep your cheeks plush and red!",
#     :symptom => ["Hey cutie-pie, do you have a dry cough :*(", "Do you maybe have a lil bit fever?"]
# }

# stern = {
#     :selected => "Good. Why would you want any of those other hussies",
#     :flirt => ["Get back to work", "Please work harder", "Get covid-19 already"],
#     :frequently => nil,
#     :water => "You better drink some water or I will make water flow from your eyes",
#     :symptom => nil
# }


# relaxed = {
#     :selected => "Thanks! But it was totally cool if you chose one of the others",
#     :flirt => ["Hey bb you make me want to stay in bed all day", "Those trackies are pretty sweet lookin' on you.", "I'm a fan of lying in bed next to you."],
#     :frequently => "How often do you want me to remind you? Just don't make it too often",
#     :water => "",
#     :symptom => ["Hey like, do you reckon you have a dry cough or whatever?", "Not that it really matters but, if you've got a fever, speak up"]
# }

# ruby_terminal_games(play)

print "\a"

