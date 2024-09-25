//
//  MissionScrollView.swift
//  HWS_Moonshot
//
//  Created by Vounatsou, Maria on 15/7/24.
//

import SwiftUI

struct MissionScrollView: View {
    
//    struct CrewMember {
//        let role: String
//        let astronaut: Astronaut
//    }
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
       
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 114, height: 72)
                                .clipShape(.capsule)
                                .overlay (
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

