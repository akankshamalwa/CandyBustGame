//
//  PlayConfirmationBottomSheetView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 12/09/23.
//

import SwiftUI

struct PlayConfirmationBottomSheetView: View {

    // MARK: - Private Properties

    @State private var isExpanded: Bool = false
    @State private var offset: CGFloat = 220

    // MARK: - Bind Property

    @Binding var isBottomSheetPresented: Bool

    // MARK: - Public Property

    let maxHeight: CGFloat

    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            //Header 1
            Text("Ready To Play?")
                .font(isExpanded ? .title2 : .subheadline)

            //Header 2
            Text("OSWALD")
                .font(isExpanded ? .title2 : .subheadline)

            HStack(alignment: .center, spacing: 10) {
                Rectangle()
                    .frame(width: 50, height: isExpanded ? 20 : 0)
                Rectangle()
                    .frame(width: 20, height: isExpanded ? 20 : 0)
            }
            .foregroundColor(.gray)

            // WalletBalanceView
            WalletBalanceView(
                isSheetOpen: $isBottomSheetPresented,
                dragOffset: $offset,
                maxHeight: maxHeight,
                foregroundColor: .black) {
                    isBottomSheetPresented.toggle()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: maxHeight)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .offset(y: isBottomSheetPresented ? offset : maxHeight)
        .animation(.easeOut(duration: 1.0))
        .onAppear {
            withAnimation {
                isExpanded.toggle()
            }
        }
        .gesture(

            // Gesture for dragging the sheet
            DragGesture()
                .onChanged { value in
                    offset = max(0, value.translation.height)
                }
                .onEnded { value in
                    if offset > maxHeight * 0.25 {
                        isBottomSheetPresented = true
                    } else {
                        isBottomSheetPresented = false
                    }
                    offset = 0
                })
    }
}

