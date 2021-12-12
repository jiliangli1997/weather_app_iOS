//
//  NineBoxView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/8/21.
//

import SwiftUI

struct NineBoxView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        ZStack{
            Image("App_background").resizable()
                .scaledToFill()
        
        VStack{
            Spacer()
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("WindSpeed")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.windSpeed!)!))") + Text("mph")
                        Text("Wind Speed")
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("Pressure")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.pressureSeaLevel!)!))") + Text("inHg")
                        Text("Pressure")
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("Precipitation")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.precipitationProbability!)!))") + Text("%")
                        Text("Precipitation")
                    }
                }
            }
            Spacer()
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("WindSpeed")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.windSpeed!)!))") + Text("°F")
                        Text("WindSpeed")
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                       
                        Image((model.weathers?.data?.timelines![1].intervals![0].values?.status!)!)  .resizable()
                            .frame(width: 80, height: 80)
                       
                        Text("\((model.weathers?.data?.timelines![1].intervals![0].values?.status!)!)")
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("Humidity")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.humidity!)!))") + Text(" %")
                        Text("Humidity")
                    }
                }
            }
            Spacer()
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("Visibility")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.visibility!)!))") + Text("mi")
                        Text("Visibility")
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("CloudCover")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.cloudCover!)!))") + Text("%")
                        Text("Cloud Cover")
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 120, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack{
                        Image("UVIndex")
                        Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.uvIndex!)!))")
                        Text("UVIndex")
                    }
                }
            }
            Spacer()
        }}
    }
}

struct NineBoxView_Previews: PreviewProvider {
    static var previews: some View {
        NineBoxView()
    }
}
