//
//  NewFoodScreen.swift
//  FatYou
//
//  Created by Глеб Москалев on 19.10.2024.
//

import SwiftUI

struct NewFoodScreen: View {
    let onClose: () -> Void
    @State var name = ""
    @State var calories = ""
    @State var protein = ""
    @State var sugar = ""
    @State var fat = ""
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                Text("Adding new food")
                    .customFont(.h1)
                    .foregroundStyle(.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
                
                NewFoodTextArea(title: "Nessesary fields"){
                    NewFoodTextFiled(text: $name, placeholder: "Name", trailingTitle: nil)
                        .padding(.bottom, 15)
                    
                    NewFoodTextFiled(text: $calories, placeholder: "Calories", trailingTitle: "cal")
                }
                
                NewFoodTextArea(title: "All other staff"){
                    NewFoodTextFiled(text: $protein, placeholder: "Protein per serving", trailingTitle: "g")
                        .padding(.bottom, 15)
                    
                    NewFoodTextFiled(text: $sugar, placeholder: "Sugar per serving", trailingTitle: "g")
                        .padding(.bottom, 15)
                    
                    NewFoodTextFiled(text: $fat, placeholder: "Fat per serving", trailingTitle: "g")
                }
                
                
                Button{
                    onClose()
                } label: {
                    Text("SAVE")
                }
                .buttonStyle(AccentButtonStyle())
                .padding(EdgeInsets(top: 21, leading: 16, bottom: 0, trailing: 16))
            }
            .frame(maxWidth: .infinity)
        }
        .navigationBarBackButtonHidden()
        .background(.lightBg)
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button{
                    onClose()
                } label: {
                    Image(.back)
                        .foregroundColor(.mainText)
                        .padding(.bottom, 12)
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct NewFoodTextFiled: View {
    @Binding var text: String
    var placeholder: String
    let trailingTitle: String?
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                TextField(text: $text) {
                    Text(placeholder)
                        .foregroundStyle(.minorTxt)
                }
                .foregroundStyle(.mainText)
                .customFont(.bodyTextSmall)

                
                Spacer()
                if let trailingTitle = trailingTitle {
                    Text(trailingTitle)
                        .foregroundStyle(.minorTxt)
                }
            }
            .padding(EdgeInsets(top: 10, leading: 8, bottom: 7, trailing: 8))
            
            Divider()
                .background(.lightGrayBg)
        }
    }
}


private struct NewFoodTextArea<Content>: View where Content: View {
    private let title: String
    private let content: () -> Content
    
    init(
        title: String,
         @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(title)
                .customFont(.h2)
                .foregroundStyle(.mainText)
                .padding(.bottom, 20)
            content()
        }
        .padding(20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .shadow2, radius: 30, x: 0, y: 15)
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
    }
}

#Preview {
    NavigationStack{
        NewFoodScreen(onClose: {})
    }
}
