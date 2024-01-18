//
//  MarsView.swift
//  NC3-DataCollections-SwiftUI-State
//
//  Created by Jeremy Skrdlant on 1/18/24.
//

import SwiftUI

struct MarsView: View {
    @State var imageURL = ""
    @State var sol = 800
    
    func updateImageURL(){
        Task{
            print("Getting Data")
            let result = try await getPhoto(sol: sol)
            if let result = result {
                print("Woot")
                self.imageURL = result.photos[0].img_src
                print(imageURL)
            }
        }
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:imageURL)) { img in
                img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Text("🤖")
            }
            
            Button(action: {
                sol = Int.random(in: 50...1000)
                updateImageURL()
                
            }, label: {
                Text("Get Picture")
            })
        }.onAppear{
            updateImageURL()
        }
    }
}

#Preview {
    MarsView()
}
