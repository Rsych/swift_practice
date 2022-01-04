//
//  AstronautView.swift
//  Moonshot
//
//  Created by Ryan J. W. Kim on 2021/10/13.
//

import SwiftUI

struct AstronautView: View {
    // MARK: - Properties
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let missionsFlown: [String]
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .center) {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                    ForEach(self.missionsFlown, id: \.self) { mission in
                        VStack{
                            Text(mission.description)
                        }
                    }
                } //: Vstack
            } //: ScrollView
        } //: GeometryReader
        .navigationTitle("\(Text(astronaut.name))")
        .navigationBarTitleDisplayMode(.inline)
        
    } //: Body
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [String]()
        
        for mission in missions {
            if mission.crew.contains(where: { $0.name == astronaut.id }) {
                matches.append("\(mission.displayName)")
            }
        }
        self.missionsFlown = matches
    }
    
}


struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
