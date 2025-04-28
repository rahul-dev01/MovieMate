import UIKit

class ViewControllerProfile: UIViewController {

    var user: AppUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            namelbl.text = user.firstName
            lastNamelbl.text = user.lastName
            mobileNumberlbl.text = user.Moblenumber
            emailLbl.text = user.email
            passlbl.text = user.password
        }
    }
    
    
    @IBOutlet weak var namelbl: UILabel!
    
    @IBOutlet weak var lastNamelbl: UILabel!
    
    @IBOutlet weak var mobileNumberlbl: UILabel!
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var passlbl: UILabel!
    
    
    @IBAction func updateBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Login Error", message: "This feature is not yet implemented \n Coming soon", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
