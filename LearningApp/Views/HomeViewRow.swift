//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Derrick White on 3/7/22.
//

import SwiftUI

struct HomeViewRow: View {
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)

            HStack {
                // Image
                Image(image)
                    .resizable()
                    .frame(width: 106, height: 106)
                    .clipShape(Circle())
                
                Spacer()
                
                // Text
                VStack(alignment: .leading, spacing: 10) {
                    // Headline
                    Text(title)
                        .bold()
                    
                    // Description
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15.0, height: 15.0)
                        
                        Text(count)
                            .font(Font.system(size: 10))
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15.0, height: 15.0)
                        
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                }
                .padding(.leading, 10)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Understand the fundamentals of the Swift programming language.", count: "10 Lessons", time: "2 Hours")
    }
}
