//
//  SearchData.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/5/21.
//

import Foundation

class SearchDat1a: ObservableObject {
    //"aa", "as", "cd", "cf"
    @Published var cityList : [String] = ["Los Angeles", "Las Vages", "cd", "cf"]
    @Published var curCity = ""
}
