import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    @IBOutlet var statusLabel: UILabel!
    
    var tripManager: TripManager?
    var tripIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        populateFields()
        statusLabel.text = ""
    }

    private func populateFields() {
        guard let index = tripIndex,
              let trip = tripManager?.trips[index] else { return }

        nameTextField.text = trip.name
        locationTextField.text = trip.location
        descriptionTextView.text = trip.description
        startDatePicker.date = trip.startDate
        endDatePicker.date = trip.endDate
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let index = tripIndex,
              let originalTrip = tripManager?.trips[index] else { return }

        let startDate = startDatePicker.date
        let endDate = endDatePicker.date

        if endDate < startDate {
            statusLabel.text = "End Date Must Be After Start Date"
            statusLabel.textColor = .systemRed
            return
        }

        let updatedTrip = Trip(
            name: nameTextField.text ?? "",
            description: descriptionTextView.text ?? "",
            location: locationTextField.text ?? "",
            startDate: startDate,
            endDate: endDate
        )

        updatedTrip.id = originalTrip.id

        tripManager?.updateTrip(updatedTrip)
        navigationController?.popViewController(animated: true)
    }
}
