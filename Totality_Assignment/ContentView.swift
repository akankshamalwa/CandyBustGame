//
//  ContentView.swift
//  Totality_Assignment
//
//  Created by Akanksha Malawade on 11/09/23.
//

import SwiftUI

struct ContentView: View {

    // MARK: Private property

    @State private var isPresentedCandyBustView = false

    // MARK: Body

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()

            // Header Play Title
            Text("PLAY")
                .padding()
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.orange)
                    .frame(width: 350, height: 500)
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.yellow)
                        .frame(width: 100, height: 100)
                        .padding()
                    Spacer()

                    // Start button
                    RoundedRectangle(cornerRadius: 120)
                        .frame(width: 320, height: 50)
                        .foregroundColor(.green)
                        .overlay(Text("START")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white))
                        .padding()
                        .onTapGesture {
                            isPresentedCandyBustView.toggle()
                        }
                }
            }
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.orange)
                .frame(width: 350, height: 200)
                .edgesIgnoringSafeArea(.bottom)

            // MARK: - FullScreenCover Presentation

        }
        .fullScreenCover(isPresented: $isPresentedCandyBustView) {
            CandyBustView()
                .animation(.interactiveSpring(), value: 0.2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
