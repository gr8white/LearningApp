//
//  LessonListView.swift
//  LearningApp
//
//  Created by Derrick White on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink {
                            ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                })
                        } label: {
                            ContentViewRow(index: index)
                        }

                    }
                }
            }
            .accentColor(.black)
            .padding(.horizontal)
            .padding(.top, 25)
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
