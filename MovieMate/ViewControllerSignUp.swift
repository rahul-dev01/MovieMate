

import UIKit

class ViewControllerSignUp: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Remove Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Sign Up Logic
    
    @IBOutlet weak var firstNameInput: UITextField!
    
    @IBOutlet weak var lastNameInput: UITextField!
    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var numberInput: UITextField!
    
    @IBOutlet weak var passInput: UITextField!
    
    @IBOutlet weak var confPassInput: UITextField!
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        if let first = firstNameInput.text, !first.isEmpty,
           let last = lastNameInput.text, !last.isEmpty,
           let number = numberInput.text, !number.isEmpty,
           let mail = emailInput.text, !mail.isEmpty,
           let pass = passInput.text, !pass.isEmpty,
           let confirm = confPassInput.text, !confirm.isEmpty {
            
            if pass != confirm {
                showAlert("Passwords do not match")
            }
            else {
                let newUser = AppUser(firstName: first, lastName: last,Moblenumber: number , email: mail, password: pass)
                UserManager.shared.addUser(newUser)
                performSegue(withIdentifier: "tosign", sender: nil)
            }
                
        }
        else {
            showAlert("Please fill all fields")
        }
    }
    
    
    
    
    func showAlert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func goToSignIn(_ sender: Any) {
        performSegue(withIdentifier: "tosign", sender: nil)
    }
}
