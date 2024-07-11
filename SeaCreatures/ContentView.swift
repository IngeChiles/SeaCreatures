//  ContentView.swift
//  SeaCreatures
//  Made with ♥︎ by Inge Chiles on 7/11/24.

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    private var seaCreatures = [
        SeaCreature(name: "Clam", modelName: "ClamScene"),
        SeaCreature(name: "Fish", modelName: "FishScene"),
        SeaCreature(name: "Slug", modelName: "SlugScene"),
        SeaCreature(name: "Starfish", modelName: "StarFishScene")
    ]
    
    @State private var selectedCreature: SeaCreature?
    
    var body: some View {
        NavigationSplitView {
            List(seaCreatures) { creature in
                Button(action: {
                    selectedCreature = creature
                }, label: {
                    Text(creature.name)
                })
            }
            .navigationTitle("Sea Creatures")
        } detail: {
            if let selectedCreature {
                Model3D(named: selectedCreature.modelName, bundle: realityKitContentBundle)
                    .navigationTitle(selectedCreature.name)
            } else {
                Text("Select a sea creature, Adron!")
            }
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
