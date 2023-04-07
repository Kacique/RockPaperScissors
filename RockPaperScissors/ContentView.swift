//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by William on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    var option = ["🪨", "📃", "✂️"]
    
    @State var correctChoice = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    @State var message = ""
    @State var playerScore = 0
    
    
    
    func playRound() -> String{
        
        var roundMessage = message
        
        if shouldWin{
            roundMessage = "Win"
            
        } else {
            roundMessage = "Lose"
        }
        
        return roundMessage
    }
    
    func optionTapped(_ number: Int) -> Int {
        print("\(option[number])")
        if option[correctChoice] == "🪨" && shouldWin == true{
            switch option{
            case ["📃"]:
                playerScore += 1
                print("Win")
            case ["✂️"]:
                playerScore -= 1
                print("Lose")
            default:
                print("Tie")
            }
        }
        shouldWin.toggle()
        
        return number
    }
    
    var body: some View {
        VStack {
            Text("Player Score: \(playerScore)")
            Text("\(option[correctChoice])")
                .font(.system(size: 200))
            Text("\(playRound())")
            
            HStack{
                ForEach(0..<3) { number in
                    Button {
                        optionTapped(number)
                    } label: {
                        Text(option[number])
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
            }
            
    
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
