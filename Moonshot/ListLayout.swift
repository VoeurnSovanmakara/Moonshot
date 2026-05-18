//
//  ListLayout.swift
//  Moonshot
//
//  Created by sovanmakara on 13/5/26.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]
    var body: some View {
            List(missions) { mission in
                NavigationLink(value: mission){
                    HStack(spacing: 16) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)

                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }

                        Spacer()
                    }
                    .padding(.vertical, 8)
                }
                .listRowBackground(Color.darkBackground)
            }
            .scrollContentBackground(.hidden)
            .background(.darkBackground)
        }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    ListLayout(missions: missions, astronauts: astronauts)
}
