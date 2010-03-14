# Conway's Game Of LIFE #

New to ruby, I'm working my way through the pickaxe. A central strength of ruby is its comfortable "list processing" abilities & a grid of cells in a evolutionary scenario is just the right spot to get into this.

As you might see if you're looking through the history & branches / stashes, this is my sandbox for playing with my new toy ruby.

As I progress through the features of ruby, this implementation of LIFE evolves. 

## History ##

### First Alpha ###

* Make it work - Make it right - Make it fast/clean
    * right now it's in the "Made it work" state
    * still missing some fudamental ruby skills
        * error handling
        * modules & mixins (still a bit uncertain about proper usage... tips welcome)
* logic for computing the Conway evolution
* view to display the ticks/generations
    * ascii representation
    * graphical repr. in progress
* oo data model
    * exists in the `cleaner_oo` branch
        * nice design but slows down the game by factor 2
    * branch `master`
        * rough / more procedural approach, but _fast_
* ui
    * cli
    * ruby-opengl version planned
    
    
Check out the TODO.md for more details. If you feel like giving feedback - right on!


    