import UIKit

class ViewControllerAddTask: UIViewController {

    var onTaskAdded: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Remove Keyboar
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    
    @IBOutlet weak var inputTask: UITextField!
    
    @IBAction func saveTaskBtn(_ sender: Any) {
        if let task = inputTask.text, !task.isEmpty {
            onTaskAdded?(task)
            navigationController?.popViewController(animated: true)
        }
        else {
            let alert = UIAlertController(title: "Empty Task", message: "Please enter a task", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}
