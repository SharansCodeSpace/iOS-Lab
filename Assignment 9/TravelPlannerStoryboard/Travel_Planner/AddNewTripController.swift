import UIKit

class AddTripViewController: UIViewController {

    var tripManager: TripManager?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = ""
    }

    @IBAction func saveTripPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty,
              let location = locationTextField.text, !location.isEmpty else {
            statusLabel.text = "Please fill all fields."
            statusLabel.textColor = .systemRed
            return
        }
        
        let startDate = startDatePicker.date
        let endDate = endDatePicker.date

        if endDate < startDate {
            statusLabel.text = "End date must be after start date."
            statusLabel.textColor = .systemRed
            return
        }

        let newTrip = Trip(name: name, description: description, location: location, startDate: startDate, endDate: endDate)
        tripManager?.addTrip(newTrip)

        statusLabel.text = "Trip saved successfully!"
        statusLabel.textColor = .systemGreen

        nameTextField.text = ""
        descriptionTextField.text = ""
        locationTextField.text = ""
    }
}
