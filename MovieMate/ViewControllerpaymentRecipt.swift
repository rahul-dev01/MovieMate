import UIKit

class ViewControllerpaymentRecipt: UIViewController {
    
    var movie: Movie?
    var user: AppUser?
    
    var selectedDateOfTicket: Date?
    
    var mode : String?
    
    var totalNumberOfPerson : String?
    var totalAmountOfTicket :Int?
    
    var receivedSlot: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieImage.image = UIImage(named: movie!.images.first!)
        
        userNameLbl.text = user?.firstName
        
        numberOfPerson.text = totalNumberOfPerson
        
        ticketSlotlbl.text = receivedSlot
        
        
        if(receivedSlot == "1"){
            timeSlot.text = "8:00 Am to 11:30 Am"
        }
        else if(receivedSlot == "2"){
            timeSlot.text = "1:00 Pm to 4: 30 Pm"
        }
        else{
            timeSlot.text = "9:00 Pm to 11:30 Pm "
        }
        
        paymentModeLbl.text = mode ?? "UPI Online"
        
        
        totalAmountLbl.text = "\(totalAmountOfTicket ?? 0)"
        
        if let date = selectedDateOfTicket {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM yyyy"
            showDateLbl.text = formatter.string(from: date)
        }
        
        movieNameLbl.text = movie?.title
        
    }
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var showDateLbl: UILabel!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBOutlet weak var numberOfPerson: UILabel!
    
    @IBOutlet weak var ticketSlotlbl: UILabel!
    
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    @IBOutlet weak var paymentModeLbl: UILabel!
    
    @IBOutlet weak var timeSlot: UILabel!
    
    
    @IBOutlet weak var movieNameLbl: UILabel!
    
    @IBAction func gotoHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
