# OOP Assignment 29/11/16
## Patrick Malone, C15398146

**Scenario**
The UI is based the following. It is hundreds of years into the future and mankind has been able to traverse 
into space. You are a commander based on Earth giving orders to a manned spaceship, trying to survive in 
space. 

**Boot up Screen**
The Boot up Screen encompasses the initialising and blink files and is made to provide an aesthetically 
pleasing intro into the program. It is done by taking a string, placing it in the middle of the screen
and animating each letter one by one as if being typed by a cursor until the word is complete. As each 
letter is seperate to one another, to provide the right spacing between the letters half the width of
the letter aswell as half the width of the following letter is used to provide the spacing between
the letters. After the Boot up Screen has completed animating the star map is then drawn, by first slowly
fading in.

**Star  Map**
The Star Map is made re-using the IO file taken from the first lab test. Some columns were added out of 
neccessity to make the program run ass desired. If the mouse is placed over a star on the screen, a cricle
will begin to animate as if being drawn around the star. After this circle is complete a make shift text box
will appear to display the relevant information about the star. The star with the Red X is the star that 
the ship is based at. When this star is clicked you are taken taken very shortly to a transition animation 
and then to the ship screen. The star map and star files are both associated with this screen.

**Ship screen**
The ship screen is the main part of this assignment, and encompasses the Button, box, ship, control panel 
and engine files. In this screen, you will see in the centre of the screen the ship in it's defaut form. 
On the left hand side of the screen there are the menu options availabe and can be all accessed by the 
user. On the bottom right hand corner there is a temperature guage, which is purely for aesthetic purposes.
There are four menus, which are test weapon, crew status, upgrade ship and resource monitor. 
The test weapon only works if one of the two weapons are equppied, and if this is a case the UI is hidden 
and an animatio of some ammunation firing is played. You press the SPACE key to go back. The crew status 
menu displays the current status of each crew member, which all depends on the current stock amount of 
each resource. The upgrade ship menu is very self explanatory, and requires 200 metal for all upgrades.
However for the weapons they can be switched around or deactivated at leisure. The Resource monitor shows
the current stock of all resources and gives an option to scavenge for more materials.

**Assignment 1 File**
This file contains all the global variables, the setup function and the draw function. The draw function
a variable called menu_check which controls what part of the program is running. 

