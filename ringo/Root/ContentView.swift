//
//  ContentView.swift
//  ringo
//
//  Created by Aarav Gupta on 12/05/26.
//

import SwiftUI
import NodeJS
import AppRouter

struct ContentView: View {
    @Environment(\.router) private var appRouter
        
    // 2. The Tab Routers
    @State private var homeRouter = Router()
    @State private var profileRouter = Router()
    
    var body: some View {
        TabView {
            Tab {
                HomeView()
                    .usingRouter(homeRouter)
            }
            
            // Node API manager view
            // Github manager view??
            
            Tab {
                NodeServerView()
            }
        }
    }
}

#Preview {
    ContentView()
}
