

import UIKit

class ViewControllerBuyTicket: UIViewController {

    var movie: Movie?
    var user: AppUser?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyMoiveNamelbl.text = movie?.title ?? "Movie Name"
        firstMoiveImage.image = UIImage(named: movie!.images.first!)
        ticketPriceLbl.text = String(movie?.price ?? 0)
        totalAmountLbl.text = String(movie?.price ?? 0)
        
        let pp = movie?.price ?? 0
        if(totalfair == 0 ){
            totalfair += pp
        }
        
        selectedDate.overrideUserInterfaceStyle = .dark
        selectedDate.backgroundColor = UIColor.black
        selectedDate.setValue(UIColor.red, forKeyPath: "textColor")
        selectedDate.layer.cornerRadius = 10
        selectedDate.layer.masksToBounds = true
        selectedDate.layer.borderColor = UIColor.red.cgColor
        selectedDate.layer.borderWidth = 1.0
    
    }
    
    @IBOutlet weak var buyMoiveNamelbl: UILabel!
   
    @IBOutlet weak var firstMoiveImage: UIImageView!
    
    
    
    
    // Pricing
    
    @IBOutlet weak var ticketPriceLbl: UILabel!
    
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    @IBOutlet weak var totalNoOfPersonLbl: UILabel!
    
    
    var totalfair = 0
 
    @IBAction func numberOfPerson(_ sender: UISlider) {
        let numOfPerson = Int(sender.value)
        totalNoOfPersonLbl.text = String(numOfPerson)
        
        let totalAmountValue = numOfPerson * Int(movie?.price ?? 0)
        totalAmountLbl.text = String(totalAmountValue)
        totalfair = totalAmountValue
    }
    
    
    
    // Movie Slot
    
    @IBOutlet weak var selectSlotLbl: UILabel!
    
    var selectedSlot: String = "1"
    
    @IBAction func slotSegmentedBtn(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            selectedSlot = "1"
            selectSlotLbl.text = selectedSlot
        } else if sender.selectedSegmentIndex == 1 {
            selectedSlot = "2"
            selectSlotLbl.text = selectedSlot
        } else {
            selectedSlot = "3"
            selectSlotLbl.text = selectedSlot
        }
    }
    
    
    // Movie Date
    
    @IBOutlet weak var selectedDate: UIDatePicker!
    
    
    @IBAction func dateBtn(_ sender: Any) {
        selectedDate.resignFirstResponder()
    }
    
    
    @IBAction func makePayment(_ sender: Any) {
        let alert = UIAlertController(title: "Select Payment Method", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "UPI", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "toUpi", sender: nil)
        }))
            
        alert.addAction(UIAlertAction(title: "Card", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "tocard", sender: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUpi" {
            let destinationdetail = segue.destination as! ViewControllerpaymentUpiOrSuccess
            destinationdetail.movie = movie
            destinationdetail.totalNumberOfPerson = totalNoOfPersonLbl!.text
            destinationdetail.totalAmountOfTicket = totalfair
            
            destinationdetail.receivedSlot = selectedSlot
            destinationdetail.user = user
            
            destinationdetail.selectedDateOfTicket = selectedDate.date
           
        }
        else{
            let destinationdetail = segue.destination as! ViewControllerpaymentCard
            destinationdetail.movie = movie
            destinationdetail.totalNumberOfPerson = totalNoOfPersonLbl!.text
            destinationdetail.totalAmountOfTicket = totalfair
            
            destinationdetail.receivedSlot = selectedSlot
            destinationdetail.user = user
            
            destinationdetail.selectedDateOfTicket = selectedDate.date
        }
    }
}
