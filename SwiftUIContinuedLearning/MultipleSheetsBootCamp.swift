//
//  MultipleSheetsBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 20/06/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootCamp: View {
    
    @State var selectedModel: RandomModel? = nil
//    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
//        .sheet(isPresented: $showSheet, content: {
//            NextScreen(selectedModel: selectedModel
//                        //$selectedModel
//            )
        
    }
}

struct NextScreen: View {
    
    //@Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootCamp()
}
