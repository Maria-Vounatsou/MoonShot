//
//  MainView.swift
//  HWS_Moonshot
//
//  Created by Vounatsou, Maria on 25/7/24.
//

import SwiftUI
import Foundation

struct MainView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    
    var body: some View {
        NavigationStack {
            VStack {
                if showingGrid {
                    GridView(astronauts: astronauts, missions: missions)
                } else {
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingGrid.toggle()
                    }) {
                        Image(systemName: showingGrid ? "list.dash" : "square.grid.2x2")
                    }
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}
