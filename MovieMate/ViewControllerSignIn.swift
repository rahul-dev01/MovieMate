import UIKit

class ViewControllerSignIn: UIViewController , UITextFieldDelegate{

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
    
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    var userName : String = ""
    
    var userData: AppUser?
    
    @IBAction func SignInBtn(_ sender: Any) {
        if let email = userEmail.text, !email.isEmpty,
           let password = userPassword.text, !password.isEmpty {
            if let user = UserManager.shared.validate(email: email, password: password) {
                userData = user
                userName = user.firstName
                
                performSegue(withIdentifier: "tohome", sender: nil)
            }
            else {
                showAlert("Invalid email or password")
            }
        }
        else {
            showAlert("Enter email and password")
        }
    }
    
    
    func showAlert(_ msg: String) {
        let alert = UIAlertController(title: "Login Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    
    
    
    
    
    // Forgot Button
    
    @IBAction func forgotBtn(_ sender: Any) {
        let yesAction = { (action: UIAlertAction) -> Void in
            let ifyes = UIAlertController(title: "", message: "You Are Not Allowed At this Moment Please Try Again Later", preferredStyle: UIAlertController.Style.alert)
            ifyes.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler:nil ))
            self.present(ifyes , animated: true)
        }
        
        let forgetAlert = UIAlertController(title: "Forget Password", message: "Do You Want To Reset Your Password", preferredStyle: UIAlertController.Style.alert)
        forgetAlert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: yesAction))
        forgetAlert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        present(forgetAlert , animated: true)
    }
    
    
    @IBAction func gotoSignUp(_ sender: Any) {
        performSegue(withIdentifier: "gotoSignUp", sender: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tohome" {
            if let navController = segue.destination as? UINavigationController,
               let destinationVC = navController.topViewController as? ViewControllerHome {
                destinationVC.userNameLabel = userName
                destinationVC.user = userData
            }
        }
    }
}
