//
//  AccentButtonStyle.swift
//  FatYou
//
//  Created by Глеб Москалев on 19.10.2024.
//

import SwiftUI

struct AccentButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .customFont(.buttonText)
            .foregroundColor(.white)
            .padding([.top, .bottom], 15)
            .frame(maxWidth: .infinity)
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
