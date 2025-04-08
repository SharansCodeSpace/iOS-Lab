import Foundation

class TripStore: ObservableObject {
    @Published var trips: [Trip] = []
    private let saveKey = "SavedTrips"

    init() {
        loadTrips()
    }

    func saveTrips() {
        if let encoded = try? JSONEncoder().encode(trips) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    func loadTrips() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Trip].self, from: data) {
            trips = decoded
        }
    }

    func addTrip(_ trip: Trip) {
        trips.append(trip)
        saveTrips()
    }

    func updateTrip(_ trip: Trip) {
        if let index = trips.firstIndex(where: { $0.id == trip.id }) {
            trips[index] = trip
            saveTrips()
        }
    }

    func deleteTrip(at offsets: IndexSet) {
        trips.remove(atOffsets: offsets)
        saveTrips()
    }

    func deleteTrip(_ trip: Trip) {
        trips.removeAll { $0.id == trip.id }
        saveTrips()
    }
}
