//
//  CircleImage.swift
//  landmark
//
//  Created by mingyue on 2020/2/10.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("ymyImage").clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
