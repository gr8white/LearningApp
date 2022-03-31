//
//  TestView.swift
//  LearningApp
//
//  Created by Derrick White on 3/22/22.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
            VStack {
                if model.currentQuestion != nil {
                // Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    
                // Question
                CodeTextView()
                
                // Answers
                
                // Button
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("\(model.currentModule?.category ?? "") Test")
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
