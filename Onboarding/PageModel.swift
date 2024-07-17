//
//  PageModel.swift
//  Onboarding
//
//  Created by Артём on 16.07.2024.
//

import SwiftUI

struct PageModel: Identifiable {
    let id: UUID = UUID()
    
    var info: String
    var title: String
    var colors: [Color]
    
    var imageName: String {
        return title
    }
    
    static let testData: [PageModel] = [
        PageModel(
            info: "Маленький телефон для повседневного использования",
            title: "iPhone",
            colors: [Color.red, Color.red.opacity(0.5)]
        ),
        PageModel(
            info: "Планшет для всякой всячины большой и крутой",
            title: "iPad",
            colors: [Color.orange, Color.orange.opacity(0.5)]
        ),
        PageModel(
            info: "Компуктер для всякой всячины",
            title: "iMac",
            colors: [Color.blue, Color.blue.opacity(0.5)]
        )
    ]
}

struct Onboarding: View {
//    @Binding var isOnboarded: Bool = false
    @State var currentPage: Int = 0
    var pages: [PageModel]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(pages.indices, id: \.self) {
                    index in
                    let page = pages[index]
                    ZStack {
                        VStack {
                            Image(page.imageName)
                                .resizable()
                                .scaledToFit()
                            Text(page.title)
                                .font(.title)
                            Text(page.info)
                                .font(.subheadline)
                                .padding(.horizontal)
                            HStack {
                                Group {
                                    Button(action: {
//                                        isOnboarded = true
                                    }) {
                                        Text(currentPage < pages.count - 1 ? "Skip" : "Continue")
                                            .foregroundStyle(.white)
                                    }
                                    .padding()
                                    .background(
                                        Capsule().strokeBorder(
                                            Color.white)
                                    )
                                    
                                    if currentPage < pages.count - 1 {
                                        Button(action: {
                                            withAnimation {
                                                currentPage += 1
                                            }
                                        }, label: {
                                            Text("Next")
                                                .foregroundStyle(.white)
                                        })
                                    }
                                }
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(
                        LinearGradient(
                            gradient: Gradient (
                                colors: page.colors
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea()
        }
    }
}

#Preview {
    @State var isOnboarded: Bool = false
//    Onboarding(
//       isOnboarded: $isOnboarded,
//        pages: PageModel.testData
//    )
}
