import SwiftUI

struct ContentView: View {
    @State var player = "X"
    @State var message1 = ""
    @State var message2 = ""
    @State var message3 = ""
    @State var message4 = ""
    @State var message5 = ""
    @State var message6 = ""
    @State var message7 = ""
    @State var message8 = ""
    @State var message9 = ""
    @State var gameOver = false
    @State var statusText = ""   
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text(statusText.isEmpty ? "Sıra: \(player)" : statusText)
                .font(.title3)
                .padding(.top, 8)
            
            HStack(spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message1.isEmpty {
                                    message1 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message1)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message2.isEmpty {
                                    message2 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message2)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message3.isEmpty {
                                    message3 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message3)
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            

            HStack(spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message4.isEmpty {
                                    message4 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message4)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message5.isEmpty {
                                    message5 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message5)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message6.isEmpty {
                                    message6 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message6)
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            
            HStack(spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message7.isEmpty {
                                    message7 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message7)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message8.isEmpty {
                                    message8 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message8)
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 120, height: 120)
                        .onTapGesture {
                            if !gameOver {
                                if message9.isEmpty {
                                    message9 = player
                                    checkWinner()
                                    if !gameOver {
                                        if player == "X" { player = "O" } else { player = "X" }
                                    }
                                } else {
                                }
                            }
                        }
                    Text(message9)
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            
            Button("Restart") {
                resetBoard()
            }
            .padding(.top, 8)
        }
    }
    
    func checkWinner() {
        if message1 != "" && message1 == message2 && message2 == message3 {
            statusText = "\(message1) kazandı!"
            gameOver = true
        } else if message4 != "" && message4 == message5 && message5 == message6 {
            statusText = "\(message4) kazandı!"
            gameOver = true
        } else if message7 != "" && message7 == message8 && message8 == message9 {
            statusText = "\(message7) kazandı!"
            gameOver = true
        } else if message1 != "" && message1 == message4 && message4 == message7 {
            statusText = "\(message1) kazandı!"
            gameOver = true
        } else if message2 != "" && message2 == message5 && message5 == message8 {
            statusText = "\(message2) kazandı!"
            gameOver = true
        } else if message3 != "" && message3 == message6 && message6 == message9 {
            statusText = "\(message3) kazandı!"
            gameOver = true

        } else if message1 != "" && message1 == message5 && message5 == message9 {
            statusText = "\(message1) kazandı!"
            gameOver = true
        } else if message3 != "" && message3 == message5 && message5 == message7 {
            statusText = "\(message3) kazandı!"
            gameOver = true
        } else {
            if message1 != "" && message2 != "" && message3 != "" &&
                message4 != "" && message5 != "" && message6 != "" &&
                message7 != "" && message8 != "" && message9 != "" {
                statusText = "Berabere!"
                gameOver = true
            }
        }
    }
    
    func resetBoard() {
        message1 = ""; message2 = ""; message3 = ""
        message4 = ""; message5 = ""; message6 = ""
        message7 = ""; message8 = ""; message9 = ""
        player = "X"
        statusText = ""
        gameOver = false
    }
}
