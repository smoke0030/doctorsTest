//
//  doctorsTestApp.swift
//  doctorsTest
//
//  Created by Сергей on 16.08.2024.
//

import SwiftUI

@main
struct doctorsTestApp: App {
    @StateObject var viewModel = MainViewModel()
    var body: some Scene {
        WindowGroup {
           TabBar()
        }
    }
}
