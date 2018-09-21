package craps

import java.util.Scanner
import java.io.InputStream
import scala.util.control.Breaks._


class Controller() {

  val model = new Model()

  val view = new View(this.model)

  val in = new Scanner(System.in)

  def start {
    view.welcome
    
    view.display

    breakable { while(in.hasNext()) {
      val exp = in.next
      view.pre_action
      model.eval(exp)
      view.processing_action
      view.post_action
      if (model.should_end) { 
        break 
      }
      view.display
    }}
  }
}
