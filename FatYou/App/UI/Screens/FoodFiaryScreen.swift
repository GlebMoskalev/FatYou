//
//  FoodFiaryScreen.swift
//  FatYou
//
//  Created by Глеб Москалев on 17.10.2024.
//

import SwiftUI

struct FoodFiaryScreen: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                CaloryInfo()
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
                LazyVStack (spacing: 0){
                    Text("12")
                }
                .background(.white)
                
                GeometryReader { proxy in
                    Color.white.frame(height: proxy.bounds(of: .scrollView)?.height ?? 0)
                }
            }
        }
        .background {
            Color(.lightBg)
                .edgesIgnoringSafeArea(.all)
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                VStack(spacing: -2){
                    Text("Today")
                        .customFont(.h2)
                    Text("Monday, March 2")
                        .customFont(.screenSubtitle)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing){
                Button {
                    print("Open calendar")
                }label: {
                    Image(.calendar)
                        .foregroundColor(.mainText)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.shadowColor = .clear
            appearance.backgroundColor = UIColor(resource: .lightBg)
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
        }
    }
}

private struct CaloryInfo: View {
    var body: some View {
        HStack(spacing: 0){
            Button {
                
            } label: {
                Text("123")
            }
            Spacer()
            Button {
                
            } label: {
                Text("123")
            }
        }
        .padding(EdgeInsets(top: 20, leading: 17, bottom: 23, trailing: 17))
        .background(.white)
        .clipShape(
            UnevenRoundedRectangle(
                cornerRadii:RectangleCornerRadii(
                    topLeading: 20,
                    topTrailing: 20
                )))
    }
}

#Preview {
    NavigationStack{
        FoodFiaryScreen()
    }
}
