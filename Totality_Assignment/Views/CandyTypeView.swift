//
//  CandyTypeView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 11/09/23.
//

import SwiftUI

struct CandyTypeView: View {

    //MARK: Body

    var body: some View {
        VStack(alignment: .center, spacing: 10) {

            // RoundReactangleView
            RoundReactangleView(area: 80, value: nil, foreGroundColor: .gray)

            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 150, height: 30)

            Rectangle()
                .foregroundColor(.gray)
                .frame(width: 100, height: 20)
        }
        .opacity(0.7)
    }
}

struct CandyTypeView_Previews: PreviewProvider {
    static var previews: some View {
        CandyTypeView()
    }
}
