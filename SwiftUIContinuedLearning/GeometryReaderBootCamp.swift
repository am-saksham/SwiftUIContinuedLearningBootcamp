//
//  GeometryReaderBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 20/06/24.
//

import SwiftUI

struct GeometryReaderBootCamp: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).minX
        return Double(1 - (currentX / maxDistance))
    }
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader(content: { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(
                                    degrees: getPercentage(geo: geometry) * 40),
                                    axis: (x: 0.0, y: 1.0, z: 0.0))
                    })
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
//        GeometryReader(content: { geometry in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometry.size.width * 0.6666)
//                Rectangle()
//                    .fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        })
    }
}

#Preview {
    GeometryReaderBootCamp()
}
