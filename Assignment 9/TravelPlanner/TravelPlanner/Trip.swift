import Foundation

struct Trip: Identifiable, Codable {
    let id: UUID
    var destination: String
    var startDate: Date
    var endDate: Date
    var notes: String

    init(id: UUID = UUID(), destination: String, startDate: Date, endDate: Date, notes: String) {
        self.id = id
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
        self.notes = notes
    }

    var duration: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day]
        formatter.unitsStyle = .full
        return formatter.string(from: startDate, to: endDate) ?? ""
    }
}
