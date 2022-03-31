//
//  TestResultView.swift
//  LearningApp
//
//  Created by Derrick White on 3/30/22.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var model: ContentModel
    
    var numCorrect: Int
    
    var feedbackText: String {
        guard model.currentModule != nil else { return "" }
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
        
        if pct > 0.8 {
            return "We lit!"
        } else if pct > 0.5 {
            return "Almost there, my boy!"
        } else {
            return "You tripping bruh"
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(feedbackText)
                .font(.title)
            
            Spacer()
            
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            
            Spacer()
            
            Button {
                model.currentTestSelected = nil
            } label: {
                ZStack {
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    
                    Text("Complete")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .padding()

            Spacer()
        }
    }
}

//struct TestResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestResultView()
//    }
//}
