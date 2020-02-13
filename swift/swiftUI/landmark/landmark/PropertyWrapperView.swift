//
//  PropertyWrapperView.swift
//  landmark
//
//  Created by mingyue on 2020/2/13.
//  Copyright © 2020 Gmingyue. All rights reserved.
//

import SwiftUI

extension UserDefaults {
    public enum Keys {
        static let hadShownUserGuide = "hadShownUserGuide"
    }
    var hasShownUserGuide:Bool {
        set {
            set(newValue, forKey: Keys.hadShownUserGuide)
        }
        get {
            bool(forKey: Keys.hadShownUserGuide)
        }
    }
}

struct PropertyWrapperView: View {
    @State private var showText = UserDefaults.standard.hasShownUserGuide ? "已经展示过":"没有展示过"
    var body: some View {
        Button(action:{
            if (!UserDefaults.standard.hasShownUserGuide) {
                UserDefaults.standard.hasShownUserGuide = true
                self.showText = "已经展示过"
            }
        }) {
            Text(self.showText)
        }
    }
}

struct PropertyWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperView()
    }
}
