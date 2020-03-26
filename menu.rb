require "tty-box"

# Welcome message 

def welcome_message
prompt = TTY::Prompt.new 
print TTY::Box.frame "Hi and welcome to Iso-relations Partner"
print TTY::Box.frame "This technology was created for you during this outbreak of a deadly virus"
print TTY::Box.frame ""
end