//
//  ContentView.swift
//  Moonshot
//
//  Created by Ryan J. W. Kim on 2021/10/10.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] =  Bundle.main.decode("missions.json")
    @State private var isToggle = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List(missions) {mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: self.astronauts)
                } label: {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading, spacing: nil) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if isToggle {
                            Text(mission.formattedLaunchDate)
                        } else {
                            Text(mission.formattedNames)
                        }
                    } //: Vstack
                } //: Navigation Link

            } //: List
//            .listStyle(.grouped)
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("MoonShot")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isToggle.toggle()
                    } label: {
                        Text(isToggle ? "Date" : "Crew")
                            .font(.title2)
                            .foregroundColor(.black)
                    }

                }
            }
        } //: Navigation View
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}
