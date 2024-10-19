//
//  StstisticsScreen.swift
//  FatYou
//
//  Created by Глеб Москалев on 19.10.2024.
//

import SwiftUI

struct StstisticsScreen: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                HeaderInfoView()
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                LazyVStack(spacing: 0){
                    ForEach(0..<3, id: \.self){ index in
                        StatistictsRowView(
                            isFirst: index == 0,
                            isLast: index == 2, 
                            isPreLast: index == 1)
                    }
                }
                .background{
                    Color(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .shadow2, radius: 15, y: 15)
                }
                .padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16))
            }
        }.background(.lightBg)
    }
}

private struct HeaderInfoView: View {
    var body: some View {
        HStack(spacing: 0){
            Image(.humburger)
                .padding(.trailing, 14)
            VStack(alignment: .leading, spacing: 0){
                Text("In order to loose 15 kg tiil 1 june you need to consume not more than")
                    .customFont(.screenSubtitle)
                    .foregroundStyle(.mainText)
                    .padding(.bottom, 3)
                
                Text("2000 cal per day")
                    .customFont(.h2)
                    .foregroundStyle(.accent)
            }
            .padding(.top, 6)
        }
    }
}

private struct StatistictsRowView : View {
    let isFirst: Bool
    let isLast: Bool
    let isPreLast: Bool
    
    var body: some View {
        HStack(alignment: .top,spacing: 0){
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(.lightBlue)
                    .frame(width: 5, height: PointLineHeight())
                    .padding(.top, isFirst ? 34 : 0)
                
                Circle()
                    .fill(.linkCustom)
                    .frame(width: 15, height: 15)
                    .padding(.top, 26)
            }
            .padding(.leading, 20)
            
            HStack(alignment: .top, spacing: 0){
                VStack(alignment: .leading, spacing: 0){
                    Text("90 kg")
                        .customFont(.h2)
                        .foregroundStyle(.mainText)
                    Text("since june 28, 2019")
                        .customFont(.bodyTextSmall)
                        .foregroundStyle(.mainText)
                    
                    Button {
                        
                    } label: {
                        Text("Add current weight")
                    }
                    .buttonStyle(AccentSmallButton())
                    .padding(.top, 32)
                    .frame(maxHeight: isPreLast ? .infinity : 0)
                    .clipped()

                    
                    Text("30 Day Has Left")
                        .customFont(.smallButtonTxt)
                        .foregroundStyle(.white)
                        .padding(EdgeInsets(top: 3, leading: 12, bottom: 3, trailing: 12))
                        .background(.warning)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.top, 8)
                        .frame(maxHeight: isLast ? .infinity : 0)
                        .clipped()
                }
                
                Spacer()
                
                Image(.edit)
                    .foregroundStyle(.grayBg)
            }
            .padding(EdgeInsets(top: 20, leading: 15, bottom: 20, trailing: 20))
        }
    }
    
    private func PointLineHeight() -> Double{
        if isFirst && isLast{
            0
        } else if !isFirst && isLast{
            34
        } else{
            .infinity
        }
    }
}

#Preview {
    StstisticsScreen()
}
