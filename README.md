# Terminal-Application
# Help
## Dependicies
### Gems
This Application utilises Ruby Gems, which in turn have their own Gem Dependencies. The list below lists the Main Dependencies and their versions. In turn the indented names are the dependencies that the primary gems have. You will need all of the Gems listed for the application to run. The Installation Steps Section will outline how to install them.
  
      colorize (0.8.1)
      pastel (0.8.0)
        tty-color (~> 0.5)
      strings (0.2.1)
        strings-ansi (~> 0.2)
        unicode-display_width (>= 1.5, < 3.0)
        unicode_utils (~> 1.4)
      strings-ansi (0.2.0)
      tty-box (0.7.0)
        pastel (~> 0.8)
        strings (~> 0.2.0)
        tty-cursor (~> 0.7)
      tty-color (0.6.0)
      tty-cursor (0.7.1)
      tty-prompt (0.23.0)
        pastel (~> 0.8)
        tty-reader (~> 0.8)
      tty-reader (0.9.0)
        tty-cursor (~> 0.7)
        tty-screen (~> 0.8)
        wisper (~> 2.0)
      tty-screen (0.8.1)
      unicode-display_width (2.0.0)
      unicode_utils (1.4.0)
      wisper (2.0.1)

Except for the Gems Mentioned above and their versions, it is advisable to have Bundler Installed, as it will make the installation much simpler and easier on the user. 

### Hardware Requirements:
The Application will require, a computer with the capabiltiies to run a bash file, and open a terminal like application, whether this is command prompt on Windows, or Terminal on Macs

Specifications wise, there are no real specifications that it requires, as it is quite light on hardware requirements. 

There are however some things to note:
- TTY-Prompt was found to have issues running on windows, when the program is being run from the startup script (runapp.sh) if you encounter gem issues, please run using the ruby main.rb command.
## Installation Steps:

### Installing Using Included Script:

The Application can be installed by going into the terminal and entering the below into your command terminal.
```shell
./installation.sh
```
The script will be included in the main package of the software and code, and will run through the easiest ways to install the different dependencies that the application has. However should the installation script be unavailable for any reason then there are alternatives that can be done, that are only slightly more work

### If the Script is Unavailable or you do not wish to use it
If the script is unavailable or, you simply do not want to use the script, then the main script command needed to install the dependencies from the script have been listed below

NOTE: Each Code Snippet is a Full Installation, there is no need to run both commands.

### Using Bundler:
If you have Bundler installed, then you can simply navigate to the root file 
```bash 
# navigate to the root folder
cd documents/temp/test/src
# ensure Gemfile is present in the folder
ls
# Once confirmed that Gemfile is present
bundle install
# Gem Dependencies will now be installed
```
### Using Command line:
If you do not have Bundler installed you can then install the required Gems by running the code block below: 
```bash
gem install colorize
gem install tty-prompt
gem install tty-screen
gem install tty-box
```

## Running Application:
To run the application after all dependencies is quite easy, you will need to be in the root directory in your terminal. 

Once you are in the root directory, you can either type in "./runapp.sh" or "ruby main.rb". Both will work with no issues, however if you do run the script, it will not allow for Command Line Arguments. These are outlined in the next section. 

## Command Line Arguments: 
Currently the Application has 3 Command Line Arguments that can be applied when running the application from the terminal

(If you are unaware of what a command line argument is, it is extra information that can be added to a command to modify the behaviour or output of the application or command if the developer allows for it.)

This application currently has 3 command line arguments you can pass, and it is possible to pass all of them at once, or only one etc. Their functions have been listed individually below:

### <strong>Basic Arguments</strong>:

<strong>rules</strong> : Will output the primary rules of the application and what happens should you run out of money

<strong>admin</strong>: The Application has a saving feature that requires a username and password. There is currently no way to reset this, so if someone forgets their username or password it is lost. The admin argument can be used with the command to run the game, and output a list of the usernames and passwords. This however is password protected and is only shared with other admins

<strong>reveal</strong>: This argument will reveal the current probability statistics that each of the games have.

### <strong>Balance Altering Arguments</strong>: 

These arguments exists to give you an edge in the casino or a helping hand if you need it. Only one of these can be entered at a time, and you will need to enter this argument first before the others. This will work for existing users as well as new users, so it can be used to reset if your balance is 0

<strong>Note:</strong> To prevent someone from just spamming these arguments to get an insanely high balance, these arguments will only <strong>set</strong> the balance to the amount, not add. 

<strong>easy</strong> : If you are wanting to go wild and have an easier time, then this argument will set the balance to $1000. 

<strong>normal</strong> : This will set your balance to $500.

<strong>hard</strong> : This will set your balance to $250.

<strong>maniac</strong> : This will set your balance to $100.

A quick example of how to use the arguments below:
```bash
ruby main.rb easy rules
# This will run the application, show the rules for the game, and then depending on if you are a returning user or not, ask you to login etc, and then set your balance to 1000
```
## Trouble-Shooting:
There are a few situations that can cause the Application to fail on some features, that can occur if you are not careful, these and how to fix them are outlined below:

### Missing JSON File Error: 
This error will occur when the file named users.json is missing from the root directory, either from being moved or being deleted. To resolve this, you can either pull a fresh copy from the repository or run the Restore.sh script found in the src folder. This will resolve the issue, however if you create from fresh you will lose all data stored.

### Load Error
If there is a file missing from one of the class, module or main folders, the application will either immediately run into an error, or it will run into one down the line. In order to repair this you will need to check to see if there are any files missing from the file stucture and pull from the GIT repo if there is, file structure has been outlined below:

Key  Note: Folders are Denoted with an *
Src Folder
- *Classes
    - blackjack.rb
    - errors.rb
    - games.rb
    - horses.rb
    - roulette.rb
    - slots.rb
- *Modules
    - headings.rb
    - login.rb
    - menu.rb
- GemFile
- Installation.sh
- main.rb
- Restore.sh
- Runapp.sh
- Testing Spreadsheet.xlsx
- users.json
