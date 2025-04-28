import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    
    @IBAction func getStartBtn(_ sender: Any) {
        performSegue(withIdentifier:"toResiter" , sender: nil)
    }
}
