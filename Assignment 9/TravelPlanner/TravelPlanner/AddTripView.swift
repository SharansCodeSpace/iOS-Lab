import SwiftUI

struct AddTripView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var tripStore: TripStore

    @State private var destination = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var notes = ""

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
            .navigationTitle("New Trip")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        let newTrip = Trip(
                            destination: destination,
                            startDate: startDate,
                            endDate: endDate,
                            notes: notes
                        )
                        tripStore.addTrip(newTrip)
                        dismiss()
                    }
                    .disabled(destination.isEmpty)
                }
            }
        }
    }
}
