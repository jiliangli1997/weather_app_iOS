//
//  Weather.swift
//  571hw9
//
//  Created by Jiliang Li on 12/4/21.
//



import Foundation

struct Weather: Decodable {
    var humidity: Double?
    var windSpeed: Double?
    var pressureSeaLevel: Double?
    var visibility: Double?
    
    var id: String?
    var latInfo: Double?
    var lonInfo: Double?
    var data: Data?
}

struct Data: Decodable {
    var timelines: [Timelines]?
}

struct Timelines: Decodable {
    var timestep: String?
    var startTime: String?
    var endTime: String?
    var intervals: [Intervals]?
}

struct Intervals: Decodable {
    var startTime: String?
    var formatstartTime: String?
    var values: Value?
}

struct Value: Decodable {
    var url: String?
    var status: String?
    var temperature: Double?
    var humidity: Double?
    var temperatureApparent: Double?
    var temperatureMin: Double?
    var temperatureMax: Double?
    var windSpeed: Double?
    var windDirection: Double?
    var pressureSeaLevel: Double?
    var uvIndex: Int?
    var weatherCode: Int?
    var precipitationProbability: Double?
    var precipitationType: Double?
    var sunriseTime: String?
    var sunsetTime: String?
    var visibility: Double?
    var moonPhase: Double?
    var cloudCover: Double?
    var sunsetformat: String?
    var sunriseformat: String?

}

