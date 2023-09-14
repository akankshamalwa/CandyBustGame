//
//  CarouselView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 11/09/23.
//

import SwiftUI

let model: CarouselViewModel = CarouselViewModel(id: 1, image: "image1")

struct CarouselView: View {

    // MARK: Properties

    let carouselViewModel: CarouselViewModel

    // MARK: Body

    var body: some View {
        Image(carouselViewModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 300)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(carouselViewModel: model)
    }
}
