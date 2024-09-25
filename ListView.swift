//
//  ListView.swift
//  HWS_Moonshot
//
//  Created by Vounatsou, Maria on 25/7/24.
//

import SwiftUI
import Foundation

struct ListView: View {
    
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.navyBlue
                    .edgesIgnoringSafeArea(.all)
                
                List {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .background(Color("NavyBlue"))
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                        .listRowBackground(Color("NavyBlue"))
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Moonshot")
                .preferredColorScheme(.dark)
            }
        }
    }
}
