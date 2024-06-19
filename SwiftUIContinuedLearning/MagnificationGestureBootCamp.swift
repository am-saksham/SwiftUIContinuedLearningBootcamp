//
//  MagnificationGestureBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 18/06/24.
//

import SwiftUI

struct MagnificationGestureBootCamp: View {
    
    @GestureState var currentAmount: CGFloat = 0
     
    var body: some View {
        
        VStack(spacing: 10) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                
                Text("Saksham Gupta")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1+currentAmount)
                .gesture(
                    MagnifyGesture()
                        .updating($currentAmount, body: { value, gesture, transaction in
                            gesture = value.magnification
                        })
                )
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        }
//        Text("Hello, World!")
//            .font(.title)
//            .padding(40)
//            .background(Color.red)
//            .cornerRadius(20)
//            .scaleEffect(1+currentAmount)
//            .gesture(
//                MagnifyGesture()
//                    .updating($currentAmount, body: { value, gesture, transaction in
//                        gesture = value.magnification
//                    })
//            )
    }
}

#Preview {
    MagnificationGestureBootCamp()
}
