//
//  Font + Extension.swift
//  doctorsTest
//
//  Created by Сергей on 16.08.2024.
//

import SwiftUI

extension Text {
    func blackCustom() -> some View {
        self
            .font(.system(size: 16, weight: .semibold))
    }
    
    func grayCustom() -> some View {
        self
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.gray)
    }
}
