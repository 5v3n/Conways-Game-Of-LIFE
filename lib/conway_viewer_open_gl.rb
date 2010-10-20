require 'opengl'
require File.join(File.dirname(__FILE__),  'conway_viewer')

# Display a Conway's Game Of Life in OpenGL.
#
# used http://basic4gl.wikispaces.com/2D+Drawing+in+OpenGL for optimizing the 2D use.
#
module ConwayViewerOpenGL



  def ConwayViewerOpenGL.init(x_size=640, y_size=480)
   glMatrixMode(GL_PROJECTION)
   glLoadIdentity()
   glOrtho(0, x_size, y_size, 0, 0, 1)
   glMatrixMode(GL_MODELVIEW)
   glDisable(GL_DEPTH_TEST) #we're in a 2d world, no need for z-ordering etc.
  end

  def ConwayViewerOpenGL.keyboard(key, x, y)
    case (key)
      when ?\e
        exit(0)
      when 'n'
        display.call
    end
  end

   #openGL representations of the cell grid.
   #
   #runs its own loop!
   #
  def ConwayViewerOpenGL.to_gl(cells)
    @cells = cells
    @size=2;
    windows_size_x = cells.length*@size
    windows_size_y = cells[0].length*@size
 
    display = lambda do 
      #TODO think about... optimize this for speed if necessary
    glClear(GL_COLOR_BUFFER_BIT)
    glColor(1.0, 1.0, 1.0) #drawing color
    glClearColor(0.0, 0.0, 0.0, 0) #background color
    glBegin(GL_POINTS)
      @cells.each_index do |x|
        @cells[x].each_index do |y|
          glVertex2f(x*@size, y*@size) if @cells[x][y] == true
        end
      end
    glEnd()
    #SwapBuffers()
    glutSwapBuffers()
    end

    idle = lambda do
     @cells=ConwayEngine::iterate(@cells)
     display.call
    end
    
    keyboard = lambda do |key, x, y|
      case (key)
        when ?\e
          exit(0) #quit entire program
        when 'n'  #iterate & display ("next")
          @cells=ConwayEngine::iterate(@cells)
          display.call
      end
    end




    glutInit
    #glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB)
    glutInitWindowSize(windows_size_x, windows_size_y)
    glutInitWindowPosition(100, 100)
    glutCreateWindow("Game of LIFE")
    init(windows_size_x, windows_size_y)
    GL.PointSize( @size )
    #GL.Enable( GL::POINT_SMOOTH )
    #GL.Enable( GL::BLEND )
    glutDisplayFunc(display)
    #glutIdleFunc(idle)
    glutKeyboardFunc(keyboard)
    glutMainLoop()
 
  end


  #TODO implement opengl display
  #TODO OPTIMIZE think about...a mechanism to decide between textual & graphical / opengl viewer

    
end
