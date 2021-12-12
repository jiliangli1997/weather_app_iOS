//
//  Geo.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/6/21.
//

import Foundation

struct Geo: Decodable {
    var results:[Results]?
}
struct Results: Decodable {
    var geometry: Geometry?
}
struct Geometry: Decodable {
    var location: Location?
}
struct Location: Decodable {
    var lat: Double?
    var lng: Double?
}
