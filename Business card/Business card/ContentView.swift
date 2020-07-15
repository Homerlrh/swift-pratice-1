//
//  ContentView.swift
//  Business card
//
//  Created by ruihao li on 2020-07-14.
//  Copyright © 2020 Homer li. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.09, green: 0.63, blue: 0.52 , opacity: 0.8)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Image("Homer")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white,lineWidth: 5)
                )
                
                Text("Homer Li")
                    .font(Font.custom("Cedarville-Cursive", size: 50))
                    .bold()
                    .foregroundColor(.white)
                
                Text("Junior Full-Stack Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                
                Divider()
                
                InfoView(text: "+01 1324567890", imageName: "phone.fill")
                
                InfoView(text: "Email.com", imageName: "envelope.fill")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


