import UIKit
import WebKit

class ViewControllerMoiveHome: UIViewController {
    
    var movie: Movie?
    
    var user: AppUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.isHidden = true
        
        if let movie = movie {
            movieTitle.text = movie.title
            movieDes.text = movie.description
            
            
                
            var imageSet: [UIImage] = []
            for imageName in movie.images {
                if let image = UIImage(named: imageName) {
                    imageSet.append(image)
                }
            }
                    
            
            if !imageSet.isEmpty {
                movieImage.animationImages = imageSet
                movieImage.animationDuration = Double(imageSet.count) * 2
                
                movieImage.startAnimating()
            } else {
                movieImage.image = UIImage(named: movie.images.first ?? "")
            }
        }
        
        
        let rating = movie?.rating ?? 0.0
        ratinglabl.text = "Rating : \(rating) ⭐️"
        
        pricelbl.text = "Price : ₹ \((movie?.price)!) Per Person"
    }

    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieDes: UITextView!
    
    @IBOutlet weak var ratinglabl: UILabel!
    
    @IBOutlet weak var pricelbl: UILabel!
    
    
    
    
    // Button To Watch Tailor
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func watchTailor(_ sender: Any) {
        webView.isHidden = false
        let urlObj = URL(string: movie!.trailerLink)!
        let request = URLRequest(url: urlObj)
        webView.load(request)
    }
    
    
    @IBAction func butTicket(_ sender: Any) {
        performSegue(withIdentifier: "toBuyTicket", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBuyTicket" {
            if let moiveNameToBuy = segue.destination as? ViewControllerBuyTicket {
                moiveNameToBuy.movie = movie
                moiveNameToBuy.user = user
            }
        }
    }
}
