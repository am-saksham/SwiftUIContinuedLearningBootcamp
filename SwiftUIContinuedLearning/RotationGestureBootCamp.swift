//
//  RotationGestureBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 19/06/24.
//

import SwiftUI

struct RotationGestureBootCamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue)
            .cornerRadius(20)
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged({ value in
                        angle = value.rotation
                    })
                    .onEnded{ value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
        
    }
}

#Preview {
    RotationGestureBootCamp()
}
