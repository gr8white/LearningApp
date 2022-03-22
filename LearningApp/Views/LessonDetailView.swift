//
//  LessonDetailView.swift
//  LearningApp
//
//  Created by Derrick White on 3/8/22.
//

import SwiftUI
import AVKit

struct LessonDetailView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                    .clipShape(Rectangle())
            }
            
            // Description
            CodeTextView()
            
            // Next Lesson Button
            if model.hasNextLesson() {
                Button {
                    model.advanceNextLesson()
                } label: {
                    
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            else {
                // Show the complete button instead
                Button {
                    // take the user back to the home view
                    model.currentContentSelected = nil
                } label: {
                    
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

//struct LessonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        LessonDetailView()
//            .environmentObject(ContentModel())
//    }
//}
