//
//  UserListViewModel.swift
//  demoApp
//
//  Created by Pravinkumar on 21/11/25.
//

import Foundation

class UserListViewModel {


    var users: [Userdetails] = []

    private let jsonString = """
    [
    { "name": "John Doe", "email": "john@example.com", "phone": "111-111-1111" },
    { "name": "Emma Watson", "email": "emma@example.com", "phone": "222-222-2222" },
    { "name": "Liam Johnson", "email": "liam@example.com", "phone": "333-333-3333" }
    ]
    """

    func loadUsers() {
        guard let data = jsonString.data(using: .utf8) else { return }

        do {
            let decoder = JSONDecoder()
            users = try decoder.decode([Userdetails].self, from: data)
        } catch {
            print("JSON Decode Error:", error)
        }
    }

    func numberOfRows() -> Int {
        return users.count
    }

    func userAtIndex(_ index: Int) -> Userdetails {
        return users[index]
    }
}
