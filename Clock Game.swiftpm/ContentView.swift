import SwiftUI
import Combine

struct ContentView: View {
    @State private var level = 1
    @State private var time = 20
    @State private var running = false
    @State private var playerX: CGFloat = 0
    @State private var obstacleY: CGFloat = -200
    @State private var obstacleFromLeft = true
    @State private var win = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func initialTimeForLevel(level: Int) -> Int {
        if level == 1 {
            return 20
        } else if level == 2 {
            return 18
        } else if level == 3 {
            return 16
        } else if level == 4 {
            return 14
        } else {
            return 8
        }
    }
    
    func nextLevel() {
        level += 1
        time = initialTimeForLevel(level: level)
        playerX = 0
        obstacleY = -200
        obstacleFromLeft.toggle()
        win = false
    }
    
    func resetLevel() {
        time = initialTimeForLevel(level: level)
        playerX = 0
        obstacleY = -200
        obstacleFromLeft.toggle()
        win = false
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Level \(level)")
                .font(.title)
            Text("Time \(time)")
                .font(.title2)
            ZStack {
                Rectangle().stroke(.gray)
                Rectangle()
                    .fill(.gray.opacity(0.2))
                let goalX: CGFloat = 140
                Rectangle()
                    .fill(.green.opacity(0.3))
                    .frame(width: 40, height: 200)
                    .offset(x: goalX)
                Circle()
                    .fill(.green)
                    .frame(width: 30, height: 30)
                    .offset(x: playerX, y: 0)
                Rectangle()
                    .fill(.red)
                    .frame(width: 60, height: 20)
                    .offset(x: obstacleFromLeft ? -100 : 100, y: obstacleY)
            }
            .frame(width: 320, height: 220)
            HStack {
                Button("Left") { if running { playerX -= 20 } }
                Button("Right") { if running { playerX += 20 } }
            }
            HStack {
                Button(running ? "Pause" : "Start") {
                    if running {
                        running = false
                    } else {
                        time = initialTimeForLevel(level: level)
                        running = true
                    }
                }
                Button("Reset") { resetLevel() }
            }
        }
        .padding()
        .onReceive(timer) { _ in
            if running {
                if time > 0 {
                    time -= 1
                    obstacleY += 40
                    if obstacleY > 140 {
                        obstacleY = -140
                        obstacleFromLeft.toggle()
                    }
                    let playerFrame = CGRect(x: 160 + playerX - 15, y: 110 - 15, width: 30, height: 30)
                    let obstX = obstacleFromLeft ? 160 - 100 - 30 : 160 + 100 - 30
                    let obstacleFrame = CGRect(x: CGFloat(obstX), y: 110 + obstacleY - 10, width: 60, height: 20)
                    if playerFrame.intersects(obstacleFrame) {
                        running = false
                        resetLevel()
                    }
                    if playerX >= 140 {
                        win = true
                        running = false
                        nextLevel()
                    }
                } else {
                    running = false
                    resetLevel()
                }
            }
        }
    }
}
