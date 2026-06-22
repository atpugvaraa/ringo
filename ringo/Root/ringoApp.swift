//
//  ringoApp.swift
//  ringo
//
//  Created by Aarav Gupta on 12/05/26.
//

import SwiftUI
import NodeJS
import AppRouter

@main
struct ringoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State private var appRouter = Router()
    
    init() {
        if let scriptPath = Bundle.main.path(forResource: "main", ofType: "js", inDirectory: "nodejs-project") {
            NodeRuntime.start(scriptPath: scriptPath)
        } else {
            NodeRuntime.startIfNeeded()
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .usingRouter(appRouter)
        }
        .onChange(of: scenePhase) { _, newPhase in
            print("Scene phase changed: \(String(describing: newPhase))")
            handleScenePhaseChange(newPhase)
        }
    }
    
    func handleScenePhaseChange(_: ScenePhase) {
        // ViewModel handles scene phase if needed, or we can expose it via interface
    }
}
