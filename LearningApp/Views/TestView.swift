//
//  TestView.swift
//  LearningApp
//
//  Created by Derrick White on 3/22/22.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        VStack (alignment: .leading) {
            if model.currentQuestion != nil {
                // Question Number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers
                ScrollView {
                    VStack {
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { i in
                            Button {
                                selectedAnswerIndex = i
                            } label: {
                                ZStack {
                                    if submitted {
                                        if (i == selectedAnswerIndex && i == model.currentQuestion!.correctIndex) || (i == model.currentQuestion!.correctIndex) {
                                            RectangleCard(color:  .green)
                                                .frame(height: 48)
                                        } else if i == selectedAnswerIndex && i != model.currentQuestion!.correctIndex {
                                            RectangleCard(color:  .red)
                                                .frame(height: 48)
                                        } else if i == model.currentQuestion!.correctIndex {
                                            RectangleCard(color: .green)
                                                .frame(height: 48)
                                        } else {
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                        }
                                    } else {
                                        RectangleCard(color: i == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                    }
                                    Text(model.currentQuestion!.answers[i])
                                }
                            }
                            .disabled(submitted)
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
                
                // Button
                Button {
                    if !submitted {
                        submitted = true
                        
                        if selectedAnswerIndex == model.currentQuestion?.correctIndex {
                            numCorrect += 1
                        }
                    } else {
                        model.advanceNextQuestion()
                        
                        selectedAnswerIndex = nil
                        submitted = false
                    }
                } label: {
                    ZStack {
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text(buttonText)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                }
                .disabled(selectedAnswerIndex == nil)

            } else {
                TestResultView(numCorrect: numCorrect)
            }
        }
        .navigationTitle("\(model.currentModule?.category ?? "") Test")
    }
    
    var buttonText: String {
        if submitted {
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                return "Finished"
            } else {
                return "Next"
            }
        } else {
            return "Submit"
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
