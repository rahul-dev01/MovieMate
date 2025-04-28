import UIKit

class ViewControllerpaymentCard: UIViewController , UITextFieldDelegate {

    var movie: Movie?
    var user: AppUser?
    
    var selectedDateOfTicket: Date?
    
    var totalNumberOfPerson : String?
    var totalAmountOfTicket :Int?
    
    var receivedSlot: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalAmountForCardlbl.text = "₹ \(totalAmountOfTicket ?? 0)"
    }
    
    
    // Remove Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    // Card Details Input checks
    
    
    @IBOutlet weak var cardHolderNameLbl: UITextField!
    
    @IBOutlet weak var cardNumberLbl: UITextField!
    
    @IBOutlet weak var cardExpireLbl: UITextField!
    
    @IBOutlet weak var cardCvvLbl: UITextField!
    
    
    
    
    
    
    
    @IBOutlet weak var totalAmountForCardlbl: UILabel!
    
    @IBAction func cardpayBtn(_ sender: Any) {
        
        let name = cardHolderNameLbl.text ?? ""
        let cardNumber = cardNumberLbl.text ?? ""
        let expireDate = cardExpireLbl.text ?? ""
        let cvvNumber = cardCvvLbl.text ?? ""
        
        if name.isEmpty || cardNumber.isEmpty || expireDate.isEmpty || cvvNumber.isEmpty {
            showAlert(message: "Please fill in all the card details.")
            return
        }
        
        if((cardNumber.count) != 16){
            showAlert(message: "Card Number should be 16 digits")
        }
        
        if ((cvvNumber.count) != 3){
            showAlert(message: "CVV should be 3 digits")
        }
        
        performSegue(withIdentifier: "fromCard", sender: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }

    
    var paymentMode = "Card"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationdetail = segue.destination as! ViewControllerpaymentUpiOrSuccess
        destinationdetail.movie = movie
        destinationdetail.totalNumberOfPerson = totalNumberOfPerson
        destinationdetail.totalAmountOfTicket = totalAmountOfTicket
        destinationdetail.receivedSlot = receivedSlot
        
        destinationdetail.mode = paymentMode 
        destinationdetail.user = user
        
        destinationdetail.selectedDateOfTicket = selectedDateOfTicket
    }
}
