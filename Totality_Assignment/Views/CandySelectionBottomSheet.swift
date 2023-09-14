//
//  CandySelectionBottomSheet.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 11/09/23.
//

import SwiftUI

struct CandySelectionBottomSheet: View {

    // MARK: - Private Property

    @State private var isCandyTypeViewAppear = false

    // MARK: - Bind Properties

    @Binding var isSheetOpen: Bool
    @Binding var dragOffset: CGFloat

    // MARK: - Public Properties

    let maxHeight: CGFloat
    let onDismiss: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Rectangle()
                .foregroundColor(.gray)
                .frame(width: isCandyTypeViewAppear ? 200 : 0, height: isCandyTypeViewAppear ? 30 : 0)
                .animation(.easeOut(duration: 1.0))

            // Candy Type Views
            HStack(alignment: .center, spacing: 10) {
                CandyTypeView()
                CandyTypeView()
            }
            .offset(x: isCandyTypeViewAppear ? 0 : UIScreen.main.bounds.width)
            .animation(.easeOut(duration: 2.0), value: isCandyTypeViewAppear)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        isCandyTypeViewAppear.toggle()
                    }
                }
            }

            // NEXT Button
            RoundedRectangle(cornerRadius: 120)
                .frame(width: 320, height: 50)
                .foregroundColor(.green)
                .opacity(0.7)
                .overlay(Text("NEXT")
                            .font(.system(size: 20))
                            .foregroundColor(.white))
                .onTapGesture {

                    // Call the completion handler and close the sheet
                    isSheetOpen = false
                    onDismiss()
                }
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: maxHeight)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .offset(y: isSheetOpen ? dragOffset : maxHeight)
        .gesture(

            // Gesture for dragging the sheet
            DragGesture()
                .onChanged { value in
                    dragOffset = max(0, value.translation.height)
                }
                .onEnded { value in
                    if dragOffset > maxHeight * 0.25 {
                        isSheetOpen = true
                    } else {
                        isSheetOpen = false
                    }
                    dragOffset = 0
                }
        )
    }
}

