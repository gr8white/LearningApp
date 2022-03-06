//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Derrick White on 3/6/22.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
