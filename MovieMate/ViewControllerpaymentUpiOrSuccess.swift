import UIKit

class ViewControllerpaymentUpiOrSuccess: UIViewController {
    
    var movie: Movie?
    var user: AppUser?
    
    var selectedDateOfTicket: Date?
    
    var mode : String?
    
    var totalNumberOfPerson : String?
    var totalAmountOfTicket :Int?
    
    var receivedSlot: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AmoutfairLbl.text = "₹\(totalAmountOfTicket ?? 0)"
    }
    
    @IBAction func viewReciptBtn(_ sender: Any) {
        performSegue(withIdentifier: "toRecipt", sender: nil)
    }
    
    @IBOutlet weak var AmoutfairLbl: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecipt" {
            let destinationVC = segue.destination as! ViewControllerpaymentRecipt
            destinationVC.movie = movie
            destinationVC.totalNumberOfPerson = totalNumberOfPerson
            destinationVC.totalAmountOfTicket = totalAmountOfTicket
            destinationVC.receivedSlot = receivedSlot
            
            destinationVC.mode = mode
            
            destinationVC.user = user
            
            destinationVC.selectedDateOfTicket = selectedDateOfTicket
        }
    }
    
}
