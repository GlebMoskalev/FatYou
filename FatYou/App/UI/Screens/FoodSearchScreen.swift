//
//  FoodSearchScreen.swift
//  FatYou
//
//  Created by Глеб Москалев on 19.10.2024.
//

import SwiftUI

struct FoodSearchScreen: View {
    @State private var searchText = ""
    let onClose: () -> Void
    
    var body: some View {
        NavigationStack  {
            ZStack {
                SearchResultList()
                SaveButtonView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
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
                
                ToolbarItem(placement: .principal){
                    SearchFieldView(searchText: $searchText)
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        
                    }label: {
                        Image(.barcode)
                            .foregroundColor(.mainText)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.shadowColor = .clear
                appearance.backgroundColor = UIColor(.white)
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
        }
        }
    }
}

private struct SearchFieldView: View {
    @State var isSearchTextFocused = false
    @Binding var searchText: String
    
    var body: some View {
        VStack(spacing:0) {
            HStack(spacing: 0){
                TextField("", text: $searchText, onEditingChanged: { isEditing in
                    isSearchTextFocused = isEditing
                })
                    .frame(idealWidth: 100000)
                    .customFont(.inputText)
                
                Button{
                    searchText = ""
                } label: {
                    Image(.clearButton)
                }
                .fixedSize()
                .frame(width: searchText.isEmpty ? 0 : 40)
                .clipped()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 2))
            }
            
            Divider()
                .background(isSearchTextFocused ? Color.linkCustom : Color.grayBg)
        }
        .padding(EdgeInsets(top: 0, leading: -5, bottom: -5, trailing: 4))
    }
}

private struct SaveButtonView: View {
    var body: some View {
        Button{
            
        } label: {
            Text("SAVE")
                .customFont(.buttonText)
                .foregroundColor(.white)
                .padding([.top, .bottom], 15)
                .frame(maxWidth: .infinity)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }.padding([.leading, .trailing], 16)
    }
}

private struct SearchResultList: View {
    @State var selectedRow: Int?
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 0){
                SearchResultHeader(title: "RECENT")
                    .background(.lightGrayBg)
                ForEach(0...2, id: \.self){ row in
                    let isSelected = selectedRow == row
                    let data = SearchResultRowData(
                        title: "Fried eggs with ham",
                        caloryTitle: "100 g",
                        caloryAmount: "235 kcal"
                    )
                        SearchResultRow(
                            data: data,
                            isSelected: isSelected,
                            onSelect: {
                                if selectedRow != row{
                                    selectedRow = row
                                } else{
                                    selectedRow = nil
                                }
                            }
                        )
                }
                GeometryReader { proxy in
                    Color.lightBg.frame(height: proxy.bounds(of: .scrollView)?.height ?? 0)
                }
            }.padding([.bottom], 50)
        }
    }
}

private struct SearchResultHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .customFont(.screenSubtitle)
            .foregroundColor(.mainText)
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct SearchResultRowData{
    let title: String
    let caloryTitle: String
    let caloryAmount: String
    
    
}

private struct SearchResultRow: View {
    let data: SearchResultRowData
    @State private var isExpanded = false
    let isSelected: Bool
    let onSelect: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment:.center, spacing: 0) {
                VStack(alignment:.leading, spacing: 0) {
                    Text(data.title)
                        .customFont(.bodyAccsent)
                        .lineLimit(5)
                        .padding(.bottom, 11)
                    
                    HStack(spacing: 0) {
                        Text(data.caloryTitle)
                            .frame(minWidth: 40)
                            .padding(.trailing, 8)
                        
                        Button{
                            withAnimation{
                                isExpanded.toggle()
                            }
                        }label: {
                            Image(.downSmall)
                                .rotationEffect(isExpanded ? .degrees(180) : .zero)
                                .padding(.trailing, 24)
                        }
                        
                        Text(data.caloryAmount)
                            .layoutPriority(1)
                    }
                    
                    .customFont(.bodyTextSmall)
                    .lineLimit(1)
                }
                .foregroundStyle(.mainText)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 0))
                
                Spacer()
                
                Button{
                    onSelect()
                } label: {
                    Image(systemName: isSelected ? "circle.fill" : "circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding([.leading, .trailing], 16)
                        .layoutPriority(1)
                }
            }
            
            StepperView()
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 17, trailing: 0))
                .frame(maxHeight: isExpanded ? .infinity : 0)
                .opacity(isExpanded ? 1 : 0)
                .clipped()
            
            Divider()
                .background(.lightBg)
        }
        .background(isExpanded ? .lightGrayBg : .white)
    }
}

#Preview {
    FoodSearchScreen(onClose: {})
}
