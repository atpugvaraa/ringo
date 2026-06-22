//
//  Route.swift
//  ringo
//
//  Created by Aarav Gupta on 05/06/26.
//

import AppRouter
import SwiftUI

extension Route {
    // Acts like `case home`
    static var home: Route {
        Route(id: "home") {
            HomeView()
        }
    }
    
    // Acts like `case profile(String)`
    static func profile(_ id: String) -> Route {
        Route(id: "profile_\(id)") {
//            ProfileView(userId: id)
        }
    }
    
    static var settings: Route {
        Route(id: "settings") {
//            SettingsView()
        }
    }
}
