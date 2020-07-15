//
//  ContentView.swift
//  DiceRoll-swiftUI
//
//  Created by ruihao li on 2020-07-14.
//  Copyright © 2020 Homer li. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDice = 1
    @State var rightDice = 6
    
    func changeDicePattern() {
           self.leftDice = Int.random(in: 1...6)
           self.rightDice = Int.random(in: 1...6)
       }
    
    func diceRoll() {
        var countDown = 8
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if(countDown > 0){
                self.changeDicePattern()
            }else{
                timer.invalidate()
                self.changeDicePattern()
            }
            countDown -= 1
        }
    }
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("diceeLogo")
                
                Spacer()
                
                HStack{
                    DiceIamge(n: leftDice)
                    DiceIamge(n: rightDice)
                }
                .padding(.horizontal)
                
                Spacer()

                Button(action: {
                    self.diceRoll()
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceIamge: View {
    let n:Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}
