import UIKit

class ViewControllerHome: UIViewController ,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate {

    var userNameLabel:String = ""
    var user:AppUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeuserlbl.text = "WELCOME \(userNameLabel.uppercased())"
    }
    
    @IBOutlet weak var homeuserlbl: UILabel!
    
    @IBAction func userProfileBtn(_ sender: Any) {
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    
    
    // Working On Table
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var AddTaskBtn: UIBarButtonItem!
    
    
    var tasks = [
        "Go To Home",
        "Complete Swift homework",
        "Buy groceries",
        "Attend team meeting at 4 PM",
        "Workout for 30 minutes",
        "Review project code",
        "Submit assignment by tonight",
        "Read 10 pages of a book",
        "Plan weekend trip",
        "Clean workspace",
        "Meditate for 10 minutes"
    ]

    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentedControl.selectedSegmentIndex == 0 ? tasks.count : MovieManager.shared.movies.count
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        if segmentedControl.selectedSegmentIndex == 0 {
            AddTaskBtn.isHidden = false
            cellObj.textLabel?.text = tasks[indexPath.row]
//            cellObj.imageView?.image = nil
            
            cellObj.imageView?.image = UIImage(named: "taskTick2")
        } else {
            AddTaskBtn.isHidden = true
            let movie = MovieManager.shared.movies[indexPath.row]
            cellObj.textLabel?.text = movie.title
            
            let image = UIImage(named: movie.logo)
            cellObj.imageView?.image = image

            if let imageView = cellObj.imageView {
                imageView.contentMode = .scaleAspectFill
                imageView.layer.cornerRadius = 25
                imageView.layer.masksToBounds = true
                imageView.clipsToBounds = true
                imageView.frame.size = CGSize(width: 50, height: 50)
            }
        }
        return cellObj
    }
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            return "Your Daily Tasks :"
        }
        else{
            return "Latest Movies of this Month :"
        }
    }
    
    
    // change the theme of header 
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.white
            header.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            header.textLabel?.textAlignment = .left
        }
    }

    
    
    

    
    
    var selectedIndex : Int = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segmentedControl.selectedSegmentIndex == 0 {
            selectedIndex = indexPath.row
            let selectedTask = tasks[indexPath.row]
            let alert = UIAlertController(title: selectedTask, message: "Do you want to delete this task?", preferredStyle: .actionSheet)

            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                self.tasks.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            alert.addAction(deleteAction)
            alert.addAction(cancelAction)

            if let popoverController = alert.popoverPresentationController {
                popoverController.sourceView = tableView.cellForRow(at: indexPath)
                popoverController.sourceRect = tableView.cellForRow(at: indexPath)?.bounds ?? .zero
            }

            present(alert, animated: true, completion: nil)
        }
        else{
            selectedIndex = indexPath.row
            performSegue(withIdentifier: "tomovieHome", sender: nil)
        }
    }

    
    
    @IBAction func segmentChanged(_ sender: Any) {
        tableView.reloadData()
    }
        
    
    @IBAction func addTaskBtn(_ sender: Any) {
        performSegue(withIdentifier: "toAddTask", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTask" {
            let destination = segue.destination as! ViewControllerAddTask
            destination.onTaskAdded = { [weak self] newTask in
                self?.tasks.append(newTask)
                self?.tableView.reloadData()
            }
        }
        else if segue.identifier == "toProfile" {
            let destination = segue.destination as! ViewControllerProfile
            destination.user = self.user
        }
        
        else if segue.identifier == "tomovieHome" {
            let destination = segue.destination as! ViewControllerMoiveHome
            destination.movie = MovieManager.shared.movies[selectedIndex]
            destination.user = self.user
        }
    }
}
