// TravelPlannerApp.swift
import SwiftUI

@main
struct TravelPlannerApp: App {
    @StateObject private var tripStore = TripStore()
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                NavigationStack {
                    TripListView()
                        .environmentObject(tripStore)
                }
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

