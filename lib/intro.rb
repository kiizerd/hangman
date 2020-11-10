#!/usr/local/bin/ruby -w

class Intro
  @@header = 
      " 
       _   _                                          
      | | | |                                         
      | |_| | __ _ _ __   __ _ _ __ ___   __ _ _ __   
      |  _  |/ _` | '_ \\ / _` | '_ ` _ \\ / _` | '_ \\  
      | | | | (_| | | | | (_| | | | | | | (_| | | | | 
      \\_| |_/\\__,_|_| |_|\\__, |_| |_| |_|\\__,_|_| |_| 
                          __/ |                        
                         |___/                         "

  @@intro = [
    "\nThe classic game brought to the terminal with the magic of ruby.\n", 
    "\nAttempt to guess the opponents word or think of your own.\n", 
    "\nYou will have 6 attmepts to guess letters.\n",
    "\nAt any time you can attempt to solve the word for 1 of your guesses.\n",
    "\nYou will also be allowed to save the progess of your current game.\n"
  ]
  
  def initialize
    puts @@header
    puts @@intro
  end
end
