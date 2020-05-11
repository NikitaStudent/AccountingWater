//
//  File.swift
//  AccountingWater
//
//  Created by Никита on 08.05.2020.
//  Copyright © 2020 beet.inc. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    func setNotification() -> Void {
        
    }
    
    @available(iOS 13.0.0, *)
    var body: some View {
        VStack {
            Text("Notification Demo")
            Button(action: { self.setNotification() }) {
                Text("Set Notification!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        ContentView()
    }
}
