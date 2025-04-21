import UIKit

class TripListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!

    private var tripManager = TripManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGroupedBackground
        tableView.allowsSelection = true

        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripManager.trips.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trip = tripManager.trips[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath)
        cell.backgroundColor = .lightGray
        cell.textLabel?.textColor = .black
        cell.selectionStyle = .default
        cell.textLabel?.text = "Trip: \(trip.name)"
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTripDetails",
           let destinationVC = segue.destination as? TripDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.tripManager = tripManager
            destinationVC.tripIndex = indexPath.row
        } else if segue.identifier == "addTrip",
                  let destinationVC = segue.destination as? AddTripViewController {
            destinationVC.tripManager = tripManager
        }
    }
}

