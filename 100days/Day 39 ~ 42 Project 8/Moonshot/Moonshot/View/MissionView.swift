//
//  MissionView.swift
//  Moonshot
//
//  Created by Ryan J. W. Kim on 2021/10/13.
//

import SwiftUI

struct MissionView: View {
    // MARK: - Properties
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let mission: Mission
    let astronauts: [CrewMember]
    
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack{
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    Text(self.mission.formattedLaunchDate)
                        .font(.headline)
                    Text(self.mission.description)
                        .padding()
                        .layoutPriority(1)
                    ForEach(self.astronauts, id: \.role) {
                        crewmember in
                        NavigationLink(destination: AstronautView(astronaut: crewmember.astronaut)) {
                           
                        HStack{
                            Image(crewmember.astronaut.id)
                                .resizable()
                                .frame(width: 83, height: 60, alignment: .leading)
                                .clipShape(Capsule())
                                .overlay(Capsule()
                                            .stroke(Color.primary, lineWidth: 1))
                                
                            VStack(alignment: .leading, spacing: 0) {
                                Text(crewmember.astronaut.name)
                                    .font(.headline)
                                Text(crewmember.role)
                                    .foregroundColor(.secondary)
                            }
                                Spacer()
                        }
                        .padding(.horizontal)
                        } //: NavigationLink
                        .buttonStyle(PlainButtonStyle())
                    } //: Loop
                    
                    Spacer(minLength:  25)
                }
            }
        }
        .navigationTitle(Text(mission.description))
        .navigationBarTitleDisplayMode(.inline)
    }
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id
                == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0],
        astronauts: astronauts)
    }
}
