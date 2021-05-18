//
//  Models.swift
//  FirebaseBackendAPI
//
//  Created by Osaretin Idele on 18/05/2021.
//

import UIKit

class Book: Codable {
    var doc_id: String?
    var author: String?
    var book_type: String?
    var no_of_pages: Int?
    var publish_date: Date?
    var create_date: Date?
}

struct  Vehicle : Codable  {
    var doc_id: String?
    var vehicle_type: String?
    var vehicle_model: String?
    var purchase_date: Date?
    var no_of_passengers: Int?
    var create_date: Date?
}
