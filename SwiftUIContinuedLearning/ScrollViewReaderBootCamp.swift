//
//  ScrollViewReaderBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 20/06/24.
//

import SwiftUI

struct ScrollViewReaderBootCamp: View {
    
    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter a # here...", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll now") {
                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
                }
            }
            
            ScrollView {
                ScrollViewReader(content: { proxy in
                    ForEach(0..<50) { index in
                        Text("This is the item #\(index+1)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index+1)
                    }
                    .onChange(of: scrollToIndex) { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .top)
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootCamp()
}
