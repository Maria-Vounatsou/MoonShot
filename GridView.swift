//
//  ContentView.swift
//  HWS_Moonshot
//
//  Created by Vounatsou, Maria on 25/6/24.
//

import SwiftUI
import Foundation

struct GridView: View {
    
    // decode() can return any type that conforms to Codable and Swift wants to know exactly what type it will be.
    //So we use a type annotation ([String: Astronaut]) so Swift knows exactly what astronauts will be:
    
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    let colums = [ GridItem(.adaptive(minimum: 150)) ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: colums) {
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
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}
