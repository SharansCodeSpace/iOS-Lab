import UIKit
import Foundation

class TripDetailViewController: UIViewController {

    var tripManager: TripManager?
    var tripIndex: Int?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        refreshUI()
    }

    func refreshUI() {
        guard let trip = tripManager?.trips[tripIndex ?? 0] else { return }
        nameLabel.text = trip.name
        descriptionLabel.text = trip.description
        locationLabel.text = trip.location
        startDateLabel.text = formatter.string(from: trip.startDate)
        endDateLabel.text = formatter.string(from: trip.endDate)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editTrip",
           let editVC = segue.destination as? EditViewController {
            editVC.tripManager = tripManager
            editVC.tripIndex = tripIndex
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshUI()
    }
}
