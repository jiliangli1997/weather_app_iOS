//
//  WeekView.swift
//  571hw9v2
//
//  Created by Jiliang Li on 12/9/21.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        ZStack{
            Image("App_background").resizable()
                .scaledToFill()
        
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 5).frame(width: 360, height: 180).opacity(0.7).foregroundColor(.white)
                    HStack(alignment: .center){
                        Image((model.weathers?.data?.timelines![1].intervals![0].values?.status!)!)  .resizable()
                            .frame(width: 150, height: 150)
                        VStack{
                                
                            Text("\(Int((model.weathers?.data?.timelines![1].intervals![0].values?.temperature)!))").font(.system(size: 20, weight: .heavy, design: .default)) + Text("°F").font(.system(size: 20, weight: .heavy, design: .default))
                            Text("\((model.weathers?.data?.timelines![1].intervals![0].values?.status)!)").font(.system(size: 20, weight: .heavy, design: .default))
                        }
                    }
                }
                Spacer()
                Image("highcharts_ljl_1").resizable().frame(width: UIScreen.main.bounds.size.width, height: 350)
                Spacer()
            }

        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
