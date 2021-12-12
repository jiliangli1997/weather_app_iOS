//
//  picView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/8/21.
//

import SwiftUI

struct WeatherDataView: View {
    @EnvironmentObject var model: ContentModel
    @State var imgSrc = "vegas1"
    @State var width1 = 0
    @State var width2 = 0
    var body: some View {
        ZStack{
            Image("App_background").resizable()
                .scaledToFill()
        
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 360, height: 180).opacity(0.7).foregroundColor(.white)
                    VStack(alignment: .center){
                        HStack{
                            Image("Precipitation").resizable().frame(width: 50, height: 50)
                            Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.precipitationProbability!)!))") + Text("%")
                            
                        }
                        HStack{
                            Image("Humidity").resizable().frame(width: 50, height: 50)
                            Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.humidity!)!))") + Text(" %")
                        }
                        HStack{
                            Image("CloudCover").resizable().frame(width: 50, height: 50)
                            Text("\(String(format: "%.1f", (model.weathers?.data?.timelines![2].intervals![0].values?.cloudCover!)!))") + Text("%")
                        }
                    }
                }
                Spacer()
                Image("vegas1").resizable().frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width + 25 )
                Spacer()
            }

        }
    }
}

