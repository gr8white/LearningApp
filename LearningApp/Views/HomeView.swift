//
//  HomeView.swift
//  LearningApp
//
//  Created by Derrick White on 3/6/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules) { m in
                            VStack(spacing: 20) {
                                NavigationLink {
                                    LessonListView()
                                        .onAppear {
                                            model.beginModule(m.id)
                                        }
                                } label: {
                                    HomeViewRow(image: m.content.image, title: "Learn \(m.category)", description: m.content.description, count: "\(m.content.lessons.count) Lessons", time: m.content.time)
                                }
                                .buttonStyle(.plain)
                                
                                HomeViewRow(image: m.test.image, title: "\(m.category) Test", description: m.test.description, count: "\(m.test.questions.count) Questions", time: m.test.time)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
