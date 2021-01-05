//
//  My_Widget.swift
//  My-Widget
//
//  Created by Yu Hong on 2020/12/14.
//

import WidgetKit
import SwiftUI

struct LeadershipEntry:TimelineEntry {
    var date : Date
    let leadership : Leadership
}

struct Provider:TimelineProvider {
    
    @AppStorage("score" ,store:UserDefaults(suiteName: "group.poc-scene.leadership-widgit"))
    var scoreData: Data = Data()
    
    let scores = [
    Leadership(score: "100", desc: "first"),
    Leadership(score: "300",desc: "second"),
    Leadership(score: "1000", desc: "third")
    ]
    
    let score = Leadership(score:"200",desc: "first")
    
    
    func placeholder(in context: Context) -> LeadershipEntry {
        return LeadershipEntry(date: Date(), leadership: score)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (LeadershipEntry) -> Void) {

        let entry = LeadershipEntry(date: Date(), leadership: score)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<LeadershipEntry>) -> Void) {
        let entry = LeadershipEntry(date: Date(), leadership: score)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }

}



struct WidgetEntryView: View {
    
    let entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    var body: some View{
        if family == .systemSmall
        {
        ZStack{
            Color.orange.opacity(0.6)
            VStack{
                Spacer()
                Text("Last Score").font(.title).fontWeight(.bold)
                Spacer()
                Text("400").font(.title).fontWeight(.semibold)
                Spacer()
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.5))
                        .frame(width:150)
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange.opacity(0.9))
                        .frame(width: 400/1000*150)
                }.frame(height:20).padding(.horizontal)
                Spacer()
            }.foregroundColor(.white)
            Spacer()
        }
        }
        else{
            HStack{
                ZStack{
                    Color.orange.opacity(0.6)
                    VStack{
                        Spacer()
                        Text("Last Score").font(.title).fontWeight(.bold)
                        Spacer()
                        Text("400").font(.title).fontWeight(.semibold)
                        Spacer()
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.5))
                                .frame(width:150)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.orange.opacity(0.9))
                                .frame(width: 400/1000*150)
                        }.frame(height:20).padding(.horizontal)
                        Spacer()
                    }.foregroundColor(.white)
                    Spacer()
                }
                ZStack{
                    Color.blue.opacity(0.6)
                    VStack{
                        Spacer()
                        Text("Best Score").font(.title).fontWeight(.bold)
                        Spacer()
                        Text("1000").font(.title).fontWeight(.semibold)
                        Spacer()
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.5))
                                .frame(width:150)
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.9))
                                .frame(width: 150)
                        }.frame(height:20).padding(.horizontal)
                        Spacer()
                    }.foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
}

@main
struct MyWidget: Widget {
    private let kind = "Mywidget"
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }.supportedFamilies([.systemSmall, .systemMedium])
    }
}
