//
//  Friend.swift
//  FriendFace
//
//  Created by Ryan J. W. Kim on 2021/10/27.
//

import Foundation
/*
 {
 "id": "50a48fa3-2c0f-4397-ac50-64da464f9954",
 "isActive": false,
 "name": "Alford Rodriguez",
 "age": 21,
 "company": "Imkan",
 "email": "alfordrodriguez@imkan.com",
 "address": "907 Nelson Street, Cotopaxi, South Dakota, 5913",
 "about": "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.\r\n",
 "registered": "2015-11-10T01:47:18-00:00",
 "tags": [
 "cillum",
 "consequat",
 "deserunt",
 "nostrud",
 "eiusmod",
 "minim",
 "tempor"
 ],
 "friends": []
 */
// MARK: - User

struct User: Decodable,  Hashable{
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static func example1() -> User {
        return User(id: UUID(), isActive: false, name: "Alford Rodriguez",
                    age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.\r\n",
                    registered: Date(),
                    tags: ["cillum"],
                    friends: [Friend(id: UUID(), name: "Hawkins Patel")])
    }
    
    // show in preview set up only
    static let example = User(id: UUID(),
                              isActive: true,
                              name: "Test Name",
                              age: 99,
                              company: "Test.inc",
                              email: "test@test.com",
                              address: "1 Test drive, Teston",
                              about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.\r\n",
                              registered: Date(),
                              tags: ["cillum"],
                              friends: [Friend(id: UUID(), name: "Hawkins Patel")]
    )}

