//
//  HomeView.swift
//  ringo
//
//  Created by Aarav Gupta on 12/05/26.
//

import SwiftUI
import AppRouter

struct HomeView: View {
    @Environment(\.router) private var router
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color.pink.opacity(0.4)
            
            ScrollView(showsIndicators: false) {
                Text("Good Evening,")
                    .fontWeight(.semibold)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .safeAreaPadding(.top, 160)
        }
        .ignoresSafeArea()
        .overlay {
            VStack(alignment: .leading) {
                Text("Good Evening,")
                Text("Aarav Gupta")
                    .font(.title)
            }
            .fontWeight(.semibold)
            .offset(y: isPresented ? 0 : 5)
            .opacity(isPresented ? 1 : 0)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .safeAreaPadding(.top)
        }
        .animation(.easeIn, value: isPresented)
        .fontWidth(.expanded)
        .onAppear {
            isPresented = true
        }
    }
}

#Preview {
    HomeView()
}
