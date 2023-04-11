//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by William on 4/6/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State private var option = ["🪨", "📃", "✂️"]
    @State private var correctChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    @State private var count = 0
    
    struct CustomBlur: UIViewRepresentable {
        var style: UIBlurEffect.Style
        var intensity: CGFloat

        func makeUIView(context: Context) -> UIVisualEffectView {
            UIVisualEffectView()
        }

        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
            uiView.effect = UIBlurEffect(style: style)
            uiView.subviews.first?.alpha = intensity
        }
    }
    
    
    var body: some View {
        VStack {
            Text("Score: \(playerScore)")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.white)
            
            Text("\(option[correctChoice])")
                .font(.system(size: 200))
                .frame(maxWidth: 300)
                .padding(.vertical, 20)
                .background(CustomBlur( style: .regular, intensity: 0.4) )
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
            
            Text("\(shouldWin ? "Select Winning Move: " : "Select Losing Move: ")")
                .font(.system(size: 24))
                .padding(.vertical, 20)
                .bold()
                .foregroundColor(.white)
            
            HStack{
                ForEach(0..<3) { number in
                    Button {
                        optionTapped(number)
                    } label: {
                        Text(option[number])
                            .font(.system(size: 40))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 10)
                    .shadow(radius: 5)
                }
            }
            
        }
        .alert(scoreTitle, isPresented: $showScore) {
            Button("Continue", action: playRound)
        } message: {
            Text("Press continue to play again.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    func playRound(){
        correctChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        count += 1
        
        if count >= 10{
            scoreTitle = "Your final score is \(playerScore)"
            playerScore = 0
            count = 0
            showScore = true
        }
    }
    
    func optionTapped(_ number: Int){
        
        if option[correctChoice] == "🪨" && shouldWin == true{
            switch option[number]{
            case "📃":
                playerScore += 1
            case "✂️":
                playerScore -= 1
            default:
                print("Tie")
            }
        }
        else if option[correctChoice] == "🪨" && shouldWin == false{
            switch option[number]{
            case "📃":
                playerScore -= 1
            case "✂️":
                playerScore += 1
            default:
                print("Tie")
            }
        }
        else if option[correctChoice] == "📃" && shouldWin == true{
            switch option[number]{
            case "✂️":
                playerScore += 1
            case "🪨":
                playerScore -= 1
            default:
                print("Tie")
            }
        }
        else if option[correctChoice] == "📃" && shouldWin == false{
            switch option[number]{
            case "🪨":
                playerScore += 1
            case "✂️":
                playerScore -= 1
            default:
                print("Tie")
            }
        }
        else if option[correctChoice] == "✂️" && shouldWin == true{
            switch option[number]{
            case "🪨":
                playerScore += 1
            case "📃":
                playerScore -= 1
            default:
                print("Tie")
            }
        }
        else if option[correctChoice] == "✂️" && shouldWin == false{
            switch option[number]{
            case "📃":
                playerScore += 1
            case "🪨":
                playerScore -= 1
            default:
                print("Tie")
            }
        }
        else{
                print("Hello")
            }
       playRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
