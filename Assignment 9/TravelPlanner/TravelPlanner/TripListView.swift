import SwiftUI

struct TripListView: View {
    @EnvironmentObject var tripStore: TripStore
    @State private var showingAddTrip = false
    @State private var searchText = ""
    @State private var showDeleteConfirmation = false
    @State private var tripToDelete: Trip?

    var filteredTrips: [Trip] {
        if searchText.isEmpty {
            return tripStore.trips
        } else {
            return tripStore.trips.filter { $0.destination.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.3), .purple.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                if tripStore.trips.isEmpty {
                    Spacer()
                    Text("No Trips Yet! 🧳")
                        .font(.title2.bold())
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                } else {
                    List {
                        ForEach(filteredTrips) { trip in
                            HStack {
                                NavigationLink {
                                    TripDetailView(trip: trip)
                                } label: {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(trip.destination)
                                            .font(.headline)
                                            .foregroundStyle(.primary)
                                        
                                        Text("\(trip.startDate.formatted(date: .abbreviated, time: .omitted)) - \(trip.endDate.formatted(date: .abbreviated, time: .omitted))")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.vertical, 8)
                                }
                                
                                Spacer()
                                
                                
                                Button {
                                    tripToDelete = trip
                                    showDeleteConfirmation = true
                                } label: {
                                    Image(systemName: "trash.circle.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 22))
                                }
                                .buttonStyle(BorderlessButtonStyle())
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.8), .white.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
                                    .shadow(color: .gray.opacity(0.4), radius: 3, x: 0, y: 2)
                            )
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: tripStore.deleteTrip)
                    }
                    .listStyle(.plain)
                    .searchable(text: $searchText, prompt: "Search Destinations")
                    .animation(.easeInOut, value: searchText)
                }
            }
            .navigationTitle("🌍 My Trips")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAddTrip = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showingAddTrip) {
                AddTripView()
            }
            
            .alert("Delete Trip?", isPresented: $showDeleteConfirmation, presenting: tripToDelete) { trip in
                Button("Delete", role: .destructive) {
                    if let index = tripStore.trips.firstIndex(where: { $0.id == trip.id }) {
                        tripStore.deleteTrip(at: IndexSet(integer: index))
                    }
                }
                Button("Cancel", role: .cancel) { }
            } message: { trip in
                Text("Are you sure you want to delete \"\(trip.destination)\"?")
            }
        }
    }
}
