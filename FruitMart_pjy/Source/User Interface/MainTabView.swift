//
//  MainTabView.swift
//  FruitMart_pjy
//
//  Created by 박정용 on 5/17/24.
//

import SwiftUI

struct MainTabView: View {
    private enum Tabs {
        case home, recipe, gallery, myPage // 4개의 탭 정의. 탭 뷰의 태그로 활용
    }
    @State private var selectedTab: Tabs = .home // 기본값 home
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                home
                recipe
                imageGallery
                myPage
            }
            .accentColor(.primary)
        }
        .accentColor(.peach)
        .edgesIgnoringSafeArea(edges) // iOS 13.3 이하에서는 top을 적용해야 하지만,
        // iOS 13.4 이상 부터는 제외해야 함. 교재는 모두 iOS 13.3 버전으로 작성됨
    }
}

fileprivate extension View {
    func tabItem(image: String, text: String) -> some View {
        self.tabItem {
            Symbol(image, scale: .large)
                .font(Font.system(size: 17, weight: .light))
            Text(text)
        }
    }
}
    
    
private extension MainTabView {
    var home: some View {
        Home()
            .tag(Tabs.home)
            .tabItem(image: "house", text: "홈")
            .onAppear { UITableView.appearance().separatorStyle = .none }
    }
    var recipe: some View {
        Text("레시피") // 임시 화면
            .tag(Tabs.recipe)
            .tabItem(image: "book", text: "레시피")
    }
    
    var imageGallery: some View {
        Text("이미지 갤러리") // 임시 화면
            .tag(Tabs.gallery)
            .tabItem(image: "photo.on.rectangle", text: "갤러리")
    }
    
    var myPage: some View {
        Text("마이페이지") // 임시 화면
            .tag(Tabs.myPage)
            .tabItem(image: "person", text: "마이페이지")
    }
    var edges: Edge.Set {
        if #available(iOS 13.4, *) {
            return .init() // create an empty option set
        } else {
            return .top
        }
        
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .accentColor(Color.primary)
            .environmentObject(Store())
    }
}
