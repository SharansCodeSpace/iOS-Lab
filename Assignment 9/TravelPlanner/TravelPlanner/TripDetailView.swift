import SwiftUI

struct TripDetailView: View {
    @EnvironmentObject var tripStore: TripStore
    let trip: Trip
    @State private var showingEditTrip = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    Text(trip.destination)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.primary)
                    
                    Text("\(trip.startDate.formatted(date: .complete, time: .omitted)) - \(trip.endDate.formatted(date: .complete, time: .omitted))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(trip.duration)
                        .font(.caption)
                        .foregroundColor(.accentColor)
                }
                
                Divider()
                
                Text("Notes")
                    .font(.headline)
                
                Text(trip.notes.isEmpty ? "No notes" : trip.notes)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
        }
        .navigationTitle("Trip Details")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Edit") {
                    showingEditTrip = true
                }
            }
        }
        .sheet(isPresented: $showingEditTrip) {
            EditTripView(trip: trip)
        }
    }
}

