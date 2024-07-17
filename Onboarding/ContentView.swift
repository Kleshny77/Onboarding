//
//  ContentView.swift
//  Onboarding
//
//  Created by Артём on 16.07.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarded") var isOnboarded: Bool = false
    
    var body: some View {
        VStack {
            if !isOnboarded {
                Onboarding(
//                    isOnboarded: $isOnboarded,
                    pages: PageModel.testData
                )
            } else {
                Text("Welcome back")
                
                Button("url request", systemImage: "globe") {
                    Worker().fetch(url: URL(string: "apple.com")!)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
