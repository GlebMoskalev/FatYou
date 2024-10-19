//
//  StepperView.swift
//  FatYou
//
//  Created by Глеб Москалев on 19.10.2024.
//

import SwiftUI


struct StepperView: View {
    @State var value = 0
    
    var body: some View {
        HStack(spacing: 0){
            Button{
                value = max(value - 1, 0)
            } label: {
                Image(.minus)
                    .padding(8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            ZStack{
                TextField("", value: $value, format: .number)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.plain)
                    .keyboardType(.numberPad)
                    .frame(idealWidth: 79)
                    .fixedSize()
                
                Divider()
                    .background(.controlSecondary)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .padding([.leading, .trailing])
            
            Button{
                value += 1
            } label: {
                Image(.plus)
                    .padding(8)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }.fixedSize()
    }
}
