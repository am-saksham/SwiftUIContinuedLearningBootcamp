//
//  ArraysBootCamp.swift
//  SwiftUIContinuedLearning
//
//  Created by Saksham Gupta on 02/07/24.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let IsVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers()
    {
        let user1 = UserModel(name: "Saksham", points: 5, IsVerified: true)
        let user2 = UserModel(name: nil, points: 0, IsVerified: false)
        let user3 = UserModel(name: "Reeti", points: 100, IsVerified: true)
        let user4 = UserModel(name: "Parth", points: 65, IsVerified: true)
        let user5 = UserModel(name: "Yash", points: 90, IsVerified: false)
        let user6 = UserModel(name: "Vansh", points: 76, IsVerified: false)
        let user7 = UserModel(name: "Kshitij", points: 56, IsVerified: true)
        let user8 = UserModel(name: "Chris", points: 11, IsVerified: false)
        let user9 = UserModel(name: "Praveen", points: 9, IsVerified: true)
        let user10 = UserModel(name: nil, points: 1, IsVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
    func updateFilteredArray()
    {
        // sort
        /*
//        filteredArray = dataArray.sorted { user1, user2 in
//            return user1.points < user2.points // Sorts the array to ascending order
//        }
        filteredArray = dataArray.sorted(by: { $0.points < $1.points }) //SHORTCUT(USER BY DEVELOPERS)
         */
        
        // filter
        /*
//        filteredArray = dataArray.filter({ user in
//            return user.IsVerified
//        })
        filteredArray = dataArray.filter({ $0.IsVerified }) //SHORTCUT
         */
        
        // map
        /*
//        mappedArray = dataArray.map({ user in
//            return user.name
//        })
        //mappedArray = dataArray.map({ $0.name }) // SHORTCUT
        mappedArray = dataArray.compactMap({ $0.name }) // removes elements with no name
         */
        
        
        mappedArray = dataArray
                         .sorted(by: {$0.points > $1.points})
                         .filter({ $0.IsVerified })
                         .compactMap({ $0.name })
    }
         
}

struct ArraysBootCamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                // For SORT and FILTER
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if(user.IsVerified)
//                            {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                }
                
                // For MAP
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ArraysBootCamp()
}
