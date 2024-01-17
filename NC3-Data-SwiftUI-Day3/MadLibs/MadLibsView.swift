//
//  MadLibsView.swift
//  NC3-Data-SwiftUI-Day3
//
//  Created by admin on 1/16/24.
//

import SwiftUI

struct MadLibsView: View {
   @State var noun1:String = ""
   @State var noun2:String = ""
   @State var adjective:String = ""
    @State var isShown = true;
    var toggleLabel:String{
        if isShown {
            return "hide"
        }
        return "show"
    }
    
    
    var story:String {
        return "The \(noun1) was left out of the \(noun2).  It was an \(adjective) error! "
    }
    
    var body: some View {
        VStack(spacing:20){
            Text(story)
                .blur(radius: isShown ? 0 : 10)
            HStack{
                Spacer()
                Toggle(toggleLabel, isOn: $isShown)
                    .toggleStyle(.button)
            }
            
            Divider()
            TextField("Noun", text: $noun1)
                .textFieldStyle(.roundedBorder)
            TextField("Noun", text: $noun2)
                .textFieldStyle(.roundedBorder)
            TextField("Adjective", text: $adjective)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    MadLibsView()
}
