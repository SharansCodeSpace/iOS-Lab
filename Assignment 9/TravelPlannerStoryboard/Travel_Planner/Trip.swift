import Foundation

class Trip {
    var id: UUID = UUID()
    var name: String
    var description: String
    var location: String
    var startDate: Date
    var endDate: Date

    init(name: String, description: String, location: String, startDate: Date, endDate: Date) {
        self.name = name
        self.description = description
        self.location = location
        self.startDate = startDate
        self.endDate = endDate
    }
}

class TripManager {
    var trips: [Trip] = []

    init() {
        let sampleTrip = Trip(
            name: "Lonavala Trip",
            description: "We will have a great time in Lonavala",
            location: "Wet N Joy Resort",
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!
        )
        trips.append(sampleTrip)
    }

    func addTrip(_ trip: Trip) {
        trips.append(trip)
    }

    func getAllTrips() -> [Trip] {
        return trips
    }

    func getTrip(by id: UUID) -> Trip? {
        return trips.first { $0.id == id }
    }

    func updateTrip(_ updatedTrip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == updatedTrip.id }) {
            trips[index] = updatedTrip
        }
    }

    func deleteTrip(by id: UUID) {
        trips.removeAll { $0.id == id }
    }
}
