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
* System
  * get ruby-opengl running! Seems messed up with ruby 1.8 & 1.9 & corresponding gems
* fix "benchmark" showing stats every run, not only if the benchmark was involved