//
//  talkingPirateView.swift
//  NC3-Data-SwiftUI-Day3
//
//  Created by admin on 1/16/24.
//

import SwiftUI

struct talkingPirateView: View {
    @State var mouthY:CGFloat = -30
    var body: some View {
        VStack{
            Image("Top")
            Image("Bottom")
                .zIndex(-1)
                .offset(y:mouthY)
            
            Spacer()
            Text("👄")
                .font(.system(size: 40))
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            mouthY = -8
                        })
                        .onEnded({ _ in
                            mouthY = -30
                        })
                )
            Spacer()
            
        }
    }
}

#Preview {
    talkingPirateView()
}
