//
//  MovieCell.swift
//  SwiftUI_Study
//
//  Created by Jade Yoo on 2023/05/17.
//

import SwiftUI

struct MovieCell: View {
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(8)
                .padding(.horizontal, 5)
            Text("영화 제목")
                .fontWeight(.semibold)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            Text("누적관객수")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell()
    }
}
