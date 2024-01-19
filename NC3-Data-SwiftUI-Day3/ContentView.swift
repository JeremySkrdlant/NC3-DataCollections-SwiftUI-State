//
//  ContentView.swift
//  NC3-Data-SwiftUI-Day3
//
//  Created by admin on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MadLibsView()
                .tabItem {
                    VStack {
                        Image(systemName: "character.book.closed.fill.ar")
                        Text("Mad")
                    }
                }
            talkingPirateView()
                .tabItem {
                    VStack {
                        Image(systemName: "sailboat.fill")
                        Text("Pirate")
                    }
                }
            StockView()
                .tabItem {
                    
                    VStack {
                        Image(systemName: "chart.xyaxis.line")
                        Text("Stocks")
                    }
                }
            MarsView()
                .tabItem {
                    VStack {
                        Image(systemName: "paperplane.circle.fill")
                        Text("Mars")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
