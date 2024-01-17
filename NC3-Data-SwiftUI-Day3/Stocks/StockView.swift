//
//  StockView.swift
//  NC3-Data-SwiftUI-Day3
//
//  Created by admin on 1/16/24.
//

import SwiftUI

struct StockView: View {
    @State var stockPrice = 30.0
    @State var ourMoney = 1000.0
    @State var isBuying = true
    
    var rotationAngle:Double{
        return Double.random(in: -20...20)
    }
    
    
    var buttonTitle:String{
        if isBuying {
            return "Buy"
        }
        return "Sell"
    }
    
    var body: some View {
        VStack {
            //after the -, put in ourMoney value in usd format.
            Text("Our Bank Amount")
            Text("\(ourMoney.formatted(.currency(code: "usd")))")
                .kerning(10)
                .shadow(radius: 1)
            
            Spacer()
            Text("\(stockPrice.formatted(.currency(code: "usd")))")
                .bold()
                .font(.system(size: 50))
                .foregroundColor(stockPrice < 500 ? Color.goodPrice : Color.badPrice)
                
            
            
            
            Spacer()
            Button(buttonTitle) {
                // we want to subtract the stock price from ourMoney
                if isBuying{
                    ourMoney -= stockPrice
                }else {
                    ourMoney += stockPrice
                }
                isBuying = !isBuying
            }
            .bold()
            .foregroundStyle(Color.white)
            .padding()
            .padding(.horizontal, 100)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            .rotation3DEffect(Angle(degrees: rotationAngle), axis: (x: 10.0, y: 10.0, z: 10.0))
            .animation(Animation.default, value: rotationAngle)
            
            
        }
        .padding()
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timmy in
                stockPrice = Double.random(in: 3.0...1000.0)
            }
            
        }
    }
}

#Preview {
    StockView()
}
