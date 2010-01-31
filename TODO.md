# TODO #

* design a decorator mechanism for printing
  * e.g. conwayTextPrinter(myConwayEngine), conwayGUI(myConwayEngine), etc.
  * do I need a classic single inheritance decorator at all (mixins!)?
* think about increasing
  * encapsulation
  * decoupling
* think about
    * using symbols instead of boolen (:alive instead of true)
    * performance-impact? Symbol comparison is O(1)
        * true/false   : 65 ticks/sec @120x50
        * :alive/:dead : 50 ticks/sec @120x50 (see stash on 20100118)
    * tell don't ask
        * use objects for cells & grid
            * performance-impact?
                * "more" precedural : 69.58 ticks/sec @ 120x50
                * "cleaner" oo      : 30.57 ticks/sec @ 120x50
   * multithreading
        * since the cells are evolving from a constant grid, there's massive potential in parallel processing
            * performance-impact? ("more" precedural)
                * single threaded
                    * 69.58 ticks/sec @ 120x50
                    *  0.64 ticks/sec @ 1200x500
                * multi threaded  :
                    * 52.51 ticks/sec @ 120x50
                    *  0.50 ticks/sec @ 1200x500
                * JRuby 1.4.0
                    * single: 
                    * multi : 22.99 ticks/sec @ 120x50
                    
* System
  * get ruby-opengl running! Seems messed up with ruby 1.8 & 1.9 & corresponding gems

         