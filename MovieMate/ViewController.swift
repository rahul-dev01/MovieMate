import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    var videoPlayer : AVPlayer!
    
    @IBAction func userGuideBtn(_ sender: Any) {
        let path = Bundle.main.path(forResource: "demo", ofType: "mp4")
        let urlObj = URL(fileURLWithPath: path!)
        
        let videoPlayerController = AVPlayerViewController()
        videoPlayerController.player = AVPlayer(url: urlObj)
        
        present(videoPlayerController, animated: true) {
            videoPlayerController.player?.play()
        }
    }
    
    
    @IBAction func getStartBtn(_ sender: Any) {
        performSegue(withIdentifier:"toResiter" , sender: nil)
    }
}
