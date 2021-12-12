//
//  ContentModel.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/4/21.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @Published var add = true
    @Published var remove = false
    @Published var weathers:Weather?
    @Published var favWeather : [String: Weather] = [String: Weather]()
    @Published var favLoc : [String] = ["Los Angeles"]
    @Published var initialize = true
    @Published var fetch = false
    
    @Published var gotLoc = false
    @Published var opcacity = 0.9
    
    
    @Published var cityList : [String] = ["Los Angeles", "Las Vages", "Little Rock", "Louisville","Lawrence","Laredo","Bartiesville","Branson","Boston","Brooklyn","Boulder","Boise","Bowling Green","Bonner Springs","Bonham","Santa Fe","Bonita Springs", "New York"]
    @Published var date : [String] = ["12/09/2021", "12/10/2021", "12/11/2021", "12/12/2021","12/13/2021", "12/14/2021", "12/15/2021", "12/16/2021", "12/17/2021", "12/18/2021", "12/19/2021", "12/20/2021", "12/21/2021", "12/22/2021", "12/23/2021", "12/24/2021"]
    @Published var curCity = ""
    @Published var selected = "Los Angeles"
    
    @Published var geo : Geo?
    @Published var lat : Double = 34.0522342
    @Published var lon : Double = -118.2436849
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == CLAuthorizationStatus.authorizedAlways || locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse {
            print(locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse || locationManager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse)
            locationManager.startUpdatingLocation()
        } else {
            print("error")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.first
        print(locations.first ?? "no location")
        locationManager.stopUpdatingLocation()
        getLatlon(address: "Los Angeles")
    }
    
    //    func getLocation(lat: Double, lon: Double) {
    //        self.initialize = false
    //        let urlString = "https://weatherhw8-331017.wl.r.appspot.com/?lat=\(lat)&lon=\(lon)"
    //        let url = URL(string: urlString)
    //        var request = URLRequest(url: url!)
    //        request.httpMethod = "GET"
    //        let session = URLSession.shared
    //        let dataTask = session.dataTask(with: request) {(data, response, error) in
    //            if (error == nil) {
    //                do {
    //                    print(response!)
    //                    let decoder = JSONDecoder()
    //                    let result = try decoder.decode(Weather.self, from: data!)
    //                    DispatchQueue.main.async {
    //                        self.weathers = result
    //                        self.gotLoc = true
    //                        if self.selected == "Los Angeles" {
    //                            self.favWeather[self.selected] = self.weathers
    //                        }
    //                    }
    //                } catch {
    //                    print(error)
    //                }
    //
    //            }
    //        }
    //        dataTask.resume()
    //    }
    
    func getLatlon(address: String) {
        var urlString = "https://maps.googleapis.com/maps/api/geocode/json?address=\(address)&key=AIzaSyADITdIjoEx8cBGnOJFw2j3jhrCqilLAXw"
        urlString = urlString.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) {(data, response, error) in
            if (error == nil) {
                do {
                    print(response!)
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Geo.self, from: data!)
                    DispatchQueue.main.async {
                        self.geo = result
                        self.lat = (result.results![0].geometry?.location?.lat)!
                        self.lon = (result.results![0].geometry?.location?.lng)!
                    }
                } catch {
                    print(error)
                }
                
            }
        }
        dataTask.resume()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.initialize = false
            let urlString1 = "https://weatherhw8-331017.wl.r.appspot.com/?lat=\(self.lat)&lon=\(self.lon)"
            let url1 = URL(string: urlString1)
            var request1 = URLRequest(url: url1!)
            request1.httpMethod = "GET"
            let session1 = URLSession.shared
            let dataTask1 = session1.dataTask(with: request1) {(data1, response1, error1) in
                if (error1 == nil) {
                    do {
                        print(response1!)
                        let decoder1 = JSONDecoder()
                        let result1 = try decoder1.decode(Weather.self, from: data1!)
                        DispatchQueue.main.async {
                            self.weathers = result1
                            self.getImage()
                            
//                            self.weathers?.humidity = self.weathers?.data?.timelines![2].intervals![0].values?.humidity!
//                            self.weathers?.windSpeed = self.weathers?.data?.timelines![2].intervals![0].values?.windSpeed!
//                            self.weathers?.pressureSeaLevel = self.weathers?.data?.timelines![2].intervals![0].values?.pressureSeaLevel!
//                            self.weathers?.visibility = self.weathers?.data?.timelines![2].intervals![0].values?.visibility!
                            //                            print("JJJJjjjjust fetcheddddddddd")
                            //                            print("\(address)")
                            //                            print(self.weathers)
                            self.gotLoc = true
                            if self.selected == "Los Angeles" {
                                self.favWeather[self.selected] = self.weathers
                            }
                            
                        }
                    } catch {
                        print(error)
                    }
                    
                }
            }
            dataTask1.resume()
            
        }
    }
    
    
    
    func addToFav(curCity: String) {
        
        if favWeather[curCity] == nil {
            favWeather[curCity] = self.weathers
            favLoc.append(curCity)
        }
    }
    
    
    func removeFromFav(curCity: String) {
        
        favWeather[curCity] = nil
        if let index = favLoc.firstIndex(of: curCity) {
            favLoc.remove(at: index)
        }
    }
    
    func getTime(str: String) -> String {
        let time = str.prefix(16).suffix(5)
        let hour = time.prefix(2)
        let suf = time.suffix(3)
        let hourNum = Int(hour)! + 2
        var res = ""
        if (hourNum < 10) {
            res = "0" + String(hourNum) + suf
        } else {
            res = String(hourNum) + suf
        }
        return res
    }
    
    func getImage() {
        for cur in 0 ..< self.weathers!.data!.timelines![1].intervals!.count {
            
            self.weathers!.data!.timelines![1].intervals![cur].values!.sunriseformat = getTime(str: self.weathers!.data!.timelines![1].intervals![cur].values!.sunriseTime!)
            
            
            self.weathers!.data!.timelines![1].intervals![cur].values!.sunsetformat = getTime(str: self.weathers!.data!.timelines![1].intervals![cur].values!.sunsetTime!)
            
            
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 1000) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url = "Clear";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Clear"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 1100) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Mostly Clear"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 1101) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url = "Mostly Clear";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Partly Cloudy"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 1102) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url = "Mostly Cloudy";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Mostly Cloudy"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 1001) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Cloudy";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Cloudy"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 2000) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Fog";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Fog"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 2100) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Light Fog";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Light Fog"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 8000) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Thunderstorm";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Thunderstorm"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 5001) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Flurries";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Flurries"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 5100) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Light Snow";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Light Snow"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 5000) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Snow";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Snow"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 5101) {
                self.weathers!.data!.timelines![1].intervals![cur].values!.url =  "Heavy Snow";
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Heavy Snow"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 7102) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Light Ice Pellets"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 7000) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Ice Pellets"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 7101) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Heavy Ice Pellets"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 4000) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Drizzle"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 6000) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Freezing Drizzle"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 6200) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Light Freezing Rain"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 6001) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Freezing Rain"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 6201) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Heavy Freezing Rain"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 4200) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Light Rain"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 4001) {
                
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Rain"
            }
            if (self.weathers!.data!.timelines![1].intervals![cur].values!.weatherCode! == 4201) {
               
                self.weathers!.data!.timelines![1].intervals![cur].values!.status = "Heavy Rain"
            }
        }
    }
}
