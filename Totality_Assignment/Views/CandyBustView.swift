//
//  CandyBustView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 11/09/23.
//

import SwiftUI

struct CandyBustView: View {

    // MARK: Properties

    let carouselViewModels: [CarouselViewModel] = [
        .init(id: 1, image: "image1"),
        .init(id: 2, image: "image2"),
        .init(id: 3, image: "image3"),
        .init(id: 4, image: "image4")
    ]

    @State private var isCandySelectionSheetPresented = false
    @State private var isVerificationSheetPresented = false
    @State private var isConfirmationSheetPresented = false
    @State private var isCandyBustViewAppear = false
    @State private var isExpanded = false
    @State private var isOpacityChanged = false
    @State private var dragOffset: CGFloat = 220

    // MARK: Body

    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top, spacing: 10) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.yellow)
                    .frame(width: 100, height: 100)

                // Use ternary operator for better readability
                    .offset(x: isCandyBustViewAppear ? 0 : 80, y: isCandyBustViewAppear ? 0 : 100)
                    .animation(.easeOut(duration: 1.0))
                    .onAppear {
                        withAnimation {
                            isCandyBustViewAppear.toggle()
                        }
                    }

                // Candy Bust title
                VStack {
                    Text("CANDY")
                    Text("BUST")
                }
                .offset(x: isCandyBustViewAppear ? 0 : 80, y: isCandyBustViewAppear ? 0 : -10)
                .animation(.easeInOut(duration: 1.5))
                .opacity(isCandyBustViewAppear ? 1.0 : 0.0)
                .font(Font.title2.bold())

                Spacer()

                // Close Button
                Button(action: {
                    // Close button action
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
                .opacity(isOpacityChanged ? 1.0 : 0.0)
                .animation(.easeOut(duration: 2.0), value: isOpacityChanged)
            }
            .padding()

            Text("What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting")
                .foregroundColor(.black)
                .font(.subheadline)
                .opacity(isOpacityChanged ? 0.8 : 0.0)

            // Read more button
            Button(action: {
                // Read More button action
            }) {
                Text("READ MORE")
                    .foregroundColor(.green)
                    .opacity(isOpacityChanged ? 0.8 : 0.0)
            }
            .padding()
            Spacer()

            // Carousel
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 20) {
                    ForEach(carouselViewModels, id: \.id) { carouselViewModel  in
                        CarouselView(carouselViewModel: carouselViewModel)
                    }
                }
                .padding(.bottom)
            }
            .offset(x: isOpacityChanged ? 0 : UIScreen.main.bounds.width)
            Spacer()

            // Download Button
            RoundedRectangle(cornerRadius: 120)
                .frame(width:320, height: 50)
                .foregroundColor(.green)
                .overlay(Text("DOWNLOAD")
                            .font(.system(size: 20))
                            .foregroundColor(.white))

            // Use ternary operator for better readability
                .offset(y: isCandyBustViewAppear ? 0 : -150)
                .animation(.easeOut(duration: 1.0))
                .onTapGesture {
                    isCandySelectionSheetPresented.toggle()
                }
        }

        // Animation for opacity
        .animation(.easeOut(duration: 2.0), value: isOpacityChanged)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    isOpacityChanged.toggle()
                }
            }
        }
        .overlay(
            isCandySelectionSheetPresented ? overlayOfCandySelectionBottomSheet : nil
        )
        .overlay(
            isVerificationSheetPresented ? overlayOfBalanceVerificationSheet : nil
        )
        .overlay(
            isConfirmationSheetPresented ? overlayOfConfirmationSheet : nil
        )
    }

    // MARK: - Computed Properties for Overlay Views

    var overlayOfCandySelectionBottomSheet: some View {
        GeometryReader { geometry in
            CandySelectionBottomSheet(
                isSheetOpen: $isCandySelectionSheetPresented,
                dragOffset: $dragOffset,
                maxHeight: geometry.size.height * 0.5) {
                    isVerificationSheetPresented = true
                }
                .frame(height: geometry.size.height)
        }
    }

    var overlayOfBalanceVerificationSheet: some View {
        GeometryReader { geometry in
            BalanceVerificationBottomSheetView(
                isVerificationSheetPresented: $isVerificationSheetPresented,
                maxHeight: geometry.size.height * 0.5) {
                    isConfirmationSheetPresented.toggle()
                }
                .frame(height: geometry.size.height)
        }
    }

    var overlayOfConfirmationSheet: some View {
        GeometryReader { geometry in
            PlayConfirmationBottomSheetView(
                isBottomSheetPresented: $isConfirmationSheetPresented,
                maxHeight: geometry.size.height * 0.5)
                .frame(height: geometry.size.height)
        }
    }
}

struct CandyBustView_Previews: PreviewProvider {
    static var previews: some View {
        CandyBustView()
    }
}
