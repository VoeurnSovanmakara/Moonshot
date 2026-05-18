//
//  ContentView.swift
//  Moonshot
//
//  Created by sovanmakara on 12/5/26.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack{
            Group{
                if(showingGrid){
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            .navigationDestination(for: Mission.self){ mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .toolbar{
                Button{
                    showingGrid.toggle()
                } label: {
                    Image(systemName:  showingGrid ? "rectangle.grid.1x3.fill" : "square.grid.2x2.fill" )
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
