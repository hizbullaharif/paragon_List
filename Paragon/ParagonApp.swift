//
//  ParagonApp.swift
//  Paragon
//
//  Created by arsal on 9/2/25.
//

import SwiftUI

@main
struct ParagonApp: App {

    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
