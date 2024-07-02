//
//  HashableBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 02/07/24.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    let subtitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title+subtitle)
    }
}

// USING IDENTIFIABLE INSTEAD OF HASHABLE
//struct MyCustomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}


struct HashableBootCamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subtitle: "1"),
        MyCustomModel(title: "TWO", subtitle: "2"),
        MyCustomModel(title: "THREE", subtitle: "3"),
        MyCustomModel(title: "FOUR", subtitle: "4"),
        MyCustomModel(title: "FIVE", subtitle: "5"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                
                // FOR HASHABLE
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
                
                // FOR IDENTIFIABLE
//                ForEach(data) { item in
//                    Text(item.id)
//                        .font(.headline)
//                }
            }
        }
    }
}

#Preview {
    HashableBootCamp()
}
