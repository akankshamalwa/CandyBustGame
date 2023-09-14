//
//  RoundReactangleView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 12/09/23.
//

import SwiftUI

struct RoundReactangleView: View {

    // MARK: - Public Properties

    let area: CGFloat
    let value: String?
    let foreGroundColor: Color

    // MARK: - Body

    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .foregroundColor(foreGroundColor)
            .frame(width: area, height: area)
            .overlay(Text((value ?? "")))
            .foregroundColor(.white)
    }
}

struct RoundReactangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundReactangleView(area: 80, value: "10", foreGroundColor: .gray)
    }
}
