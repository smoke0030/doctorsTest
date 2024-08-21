//
//  MainView.swift
//  doctorsTest
//
//  Created by Сергей on 16.08.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.doctors, id: \.id) { doctor in
                    CatalogCell(user: doctor)
                        .background(NavigationLink("", destination: DetailView(doctor: doctor))
                            .opacity(0))
                }
            }
            .listRowSpacing(16)
        }
        .onAppear {
            viewModel.getObjects()
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
