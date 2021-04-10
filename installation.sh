#!/bin/bash

echo "Hello There, what is your name?"
read name
echo "Hi $name, nice to meet you."
echo "I am a handy little tool to assist with getting the Moss Casino Application setup"
echo "I am just going to ask you a few questions so we can make sure that we install everything up"
echo "Now first up, is bundler already installed on your machine? Y/N (Please use Uppercase)"
read bundlerinstalled
if [[ "$bundlerinstalled" == "Y" ]]
 then
    echo "Alrighty, in order to run the Application some Gems will need to be installed"
    echo "The Gems are:"
    echo "colorize, ~> 0.8.1"
    echo "tty-prompt, ~> 0.23.0"
    echo "tty-screen, ~> 0.8.1"
    echo "tty-box, ~> 0.7.0"
    echo "For more details about the dependicies of the Gems, then please read the readme.md"
    echo "Are you happy to have these installed, (They are required to run the application) (Y/N)"
    read installgems
    if [[ "$installgems" == "Y" ]]
        then
            bundle install
            echo "Would you like to run the application now?"
            read runapp
            if [[ "$runapp" == "Y" ]]
            then 
                ruby main.rb
            else
                echo "No worries, if you wish to run the application, you can type ./runapp in your terminal"
                exit 1
            fi
    else 
        echo "These Gems are required so the application cannot run, but that is up to you, if you want to try again later please rerun the script"
        exit 1
    fi
  else
    echo "No worries, some Gems will need to be installed for the Application to work"
    echo "The Gems are:"
    echo "colorize, ~> 0.8.1"
    echo "tty-prompt, ~> 0.23.0"
    echo "tty-screen, ~> 0.8.1"
    echo "tty-box, ~> 0.7.0"
    echo "Are you happy for these to be installed?"
    read installbundler
    if [[ "$installbundler" == "Y" ]]
    then
        gem install colorize
        gem install tty-prompt
        gem install tty-screen
        gem install tty-box
        echo "All done, would you like to run the app now? (Y/N)"
        read runapp
        if [[ "$runapp" == "Y" ]]
        then 
            ruby main.rb
        else
        echo "No worries, if you wish to run the application, you can type ./runapp in your terminal"
        exit 1
        fi
    else 
        echo "These Gems are required so the application cannot run, but that is up to you, if you want to try again later please rerun the script"
        exit 1
    fi
fi
