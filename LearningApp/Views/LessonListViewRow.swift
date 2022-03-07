//
//  LessonListViewRow.swift
//  LearningApp
//
//  Created by Derrick White on 3/7/22.
//

import SwiftUI

struct LessonListViewRow: View {
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 75)
            
            HStack {
                // Lesson Number
                Text(String(index + 1))
                    .font(Font.system(size: 30))
                    .bold()
                    .padding(.trailing, 30)
                
                VStack(alignment: .leading) {
                    // Lesson Title
                    Text(lesson.title)
                        .bold()
                    
                    // Lesson Duration
                    Text("Video - \(lesson.duration)")
                        .font(.caption)
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
}

