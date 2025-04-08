import SwiftUI

struct EditTripView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var tripStore: TripStore
    
    var trip: Trip
    
    @State private var destination: String
    @State private var startDate: Date
    @State private var endDate: Date
    @State private var notes: String
    
    init(trip: Trip) {
        self.trip = trip
        _destination = State(initialValue: trip.destination)
        _startDate = State(initialValue: trip.startDate)
        _endDate = State(initialValue: trip.endDate)
        _notes = State(initialValue: trip.notes)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Trip Details") {
                    TextField("Destination", text: $destination)
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $endDate, in: startDate..., displayedComponents: .date)
                }
                
                Section("Notes") {
                    TextEditor(text: $notes)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle("Edit Trip")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        if let index = tripStore.trips.firstIndex(where: { $0.id == trip.id }) {
                            tripStore.trips[index].destination = destination
                            tripStore.trips[index].startDate = startDate
                            tripStore.trips[index].endDate = endDate
                            tripStore.trips[index].notes = notes
                            tripStore.saveTrips()
                        }
                        dismiss()
                    }
                    .disabled(destination.isEmpty)
                }
            }
        }
    }
}

