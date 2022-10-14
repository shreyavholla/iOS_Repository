//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by admin on 16/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack{
            Text("iOS Development")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            Spacer()
            Text("SwiftUI Here!")
                .font(.title)
                .fontWeight(.ultraLight)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.all, 15.0)
            Spacer()
        
            Button("Continue") {
                print("Continue Clicked...")
            }
            .padding(10.0)
            .foregroundColor(.mint)
            .font(.title2)
            .border(.blue, width: 3.0)
            //
            .background(.yellow)
            .cornerRadius(10.0)
            
            Image("car")
                .renderingMode(.original)
                .resizable(resizingMode: .tile)
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color.green)
                .padding(.all, 20.0)
            
        }
        
        
        .padding(.all, 30)
        .background(.indigo)
       // .scaledToFit()
        .fixedSize(horizontal: (200 != 0), vertical: (200 != 0))
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

