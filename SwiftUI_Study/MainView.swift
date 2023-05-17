//
//  MainView.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/17.
//

import SwiftUI

struct MainView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0..<100) { item in
                        MovieCell().padding(3)
                    }
                }
            }
            .navigationBarTitle("Boxoffice", displayMode: .inline)
            .toolbar {
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.crop.circle")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
