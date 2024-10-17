//
//  MainFlow.swift
//  FatYou
//
//  Created by Глеб Москалев on 17.10.2024.
//

import SwiftUI

enum MainFlowTab{
    case foodDiary
    case statisticts
}

struct MainFlow: View {
    @State var currentTab: MainFlowTab = .foodDiary
    private let buttons = [
        TabBarButtonConfiguration(
            icon: .diary,
            title: "FOOD DIARY",
            tab: .foodDiary),
        TabBarButtonConfiguration(
            icon: .statistics,
            title: "STATISTICS",
            tab: .statisticts)
    ]
    
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $currentTab){
                Text("FOOD DIARY")
                    .tag(MainFlowTab.foodDiary)
                Text("STATISTICS")
                    .tag(MainFlowTab.statisticts)
            }
            TabBar(currentTab: $currentTab, buttons: buttons)
        }
    }
}

private struct TabBar: View {
    @Binding var currentTab: MainFlowTab
    
    let buttons: [TabBarButtonConfiguration]
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(Array(buttons.enumerated()), id: \.element.id) { (index, button) in
                let style: TabBarButtonStyle = button.tab == currentTab ? .active : .unactive
                let isTopLeadingCornerRadius = index - 1 == buttons.firstIndex { $0.id == currentTab}
                let isTopTrailingCornerRadius = index + 1 == buttons.firstIndex { $0.id == currentTab}
                TabBarButton(
                    configuration: button,
                    style: style,
                    isTopLeadingCornerRadius: isTopLeadingCornerRadius,
                    isTopTrailingCornerRadius: isTopTrailingCornerRadius,
                    action: {currentTab = button.tab})
            }
//            TabBarButton(
//                configuration: TabBarButtonConfiguration(
//                    icon: .diary,
//                    title: "FOOD DIARY",
//                    tab: .foodDiary),
//                style: .active,
//                isTopLeadingCornerRadius: false,
//                isTopTrailingCornerRadius: true, 
//                action: {currentTab = .foodDiary}
//            )
//            TabBarButton(
//                configuration: TabBarButtonConfiguration(
//                    icon: .statistics,
//                    title: "STATISTICS",
//                    tab: .statisticts),
//                style: .unactive,
//                isTopLeadingCornerRadius: true,
//                isTopTrailingCornerRadius: false,
//                action: {currentTab = .statisticts}
//            )
        }
    }
}

private struct TabBarButtonConfiguration: Identifiable{
    var id: MainFlowTab { tab}
    let icon: CustomIcons
    let title: String
    let tab: MainFlowTab
}

private struct TabBarButtonStyle{
    let backgroundColor: Color
    let foregroundColor: Color
    
    static let active = TabBarButtonStyle(backgroundColor: .white, foregroundColor: .mainText)
    static let unactive = TabBarButtonStyle(backgroundColor: .warning, foregroundColor: .white)
}

private struct TabBarButton: View {
    let configuration: TabBarButtonConfiguration
    let style: TabBarButtonStyle
    let isTopLeadingCornerRadius: Bool
    let isTopTrailingCornerRadius: Bool
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            VStack(spacing: 0){
                Image(configuration.icon)
                    .padding(.bottom, 2)
                Text(configuration.title)
                    .customFont(.bottomBarText)
                    .lineLimit(1)
            }
            .foregroundColor(style.foregroundColor)
            .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56)
            .background(style.backgroundColor)
            .clipShape(
                UnevenRoundedRectangle(
                    cornerRadii:RectangleCornerRadii(
                        topLeading: isTopLeadingCornerRadius ? 20 : 0,
                        topTrailing: isTopTrailingCornerRadius ? 20 :0
                    )))
        }
        .background{
            Color(.warning)
                .padding(.top, 56)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MainFlow()
}
