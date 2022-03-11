//
//  LessonListView.swift
//  LearningApp
//
//  Created by Derrick White on 3/7/22.
//

import SwiftUI

struct LessonListView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        NavigationLink {
                            LessonDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                })
                        } label: {
                            LessonListViewRow(index: index)
                        }

                    }
                }
            }
            .accentColor(.black)
            .padding(.horizontal)
            .padding(.top, 25)
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
