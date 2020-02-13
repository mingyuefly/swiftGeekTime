//
//  ContentView.swift
//  landmark
//
//  Created by mingyue on 2020/2/9.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView().edgesIgnoringSafeArea(.all).frame(height:300)
            CircleImage().offset(y: -130).padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("圆明园").font(.title)
                HStack {
                    Text("皇家园林").font(.subheadline)
                    Spacer()
                    Text("北京").font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
