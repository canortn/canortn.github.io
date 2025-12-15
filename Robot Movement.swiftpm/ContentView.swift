import SwiftUI

struct Position: Equatable {
    var x: Int
    var y: Int
}

struct ContentView: View {
    let gridSize = 7
    
    @State var robotX = 0
    @State var robotY = 0
    @State var path: [Position] = []
    
    let obstacles: [Position] = [
        Position(x: 3, y: 1),
        Position(x: 2, y: 4)
    ]
    
    @State var directions: [String] = []
    @State var steps: [Int] = []
    @State var message = "Tap Set Path then Run"
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Robot Movement Simulation")
                .font(.title2)
            
            gridView
            
            Text(message)
                .font(.callout)
            
            HStack(spacing: 20) {
                Button("Set Path") {
                    setupSimplePath(repeatCount: 3)
                    message = "Path ready. Tap Run."
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
                
                Button("Run") {
                    reset(startX: 0, startY: 0)
                    runSimulation()
                    message = "Finished. Robot at (\(robotX), \(robotY))"
                }
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(12)
            }
        }
        .padding()
    }
    
    var gridView: some View {
        VStack(spacing: 2) {
            ForEach(0..<gridSize, id: \.self) { y in
                HStack(spacing: 2) {
                    ForEach(0..<gridSize, id: \.self) { x in
                        Rectangle()
                            .fill(colorForCell(x: x, y: y))
                            .frame(width: 30, height: 30)
                            .overlay(
                                Rectangle().stroke(Color.black, lineWidth: 0.5)
                            )
                    }
                }
            }
        }
    }
    
    func reset(startX: Int, startY: Int) {
        robotX = startX
        robotY = startY
        path = [Position(x: startX, y: startY)]
    }
    
    func setupSimplePath(repeatCount: Int) {
        directions = []
        steps = []
        
        for _ in 0..<repeatCount {
            directions.append("right")
            steps.append(2)
            
            directions.append("down")
            steps.append(1)
            
            directions.append("left")
            steps.append(1)
            
            directions.append("down")
            steps.append(1)
        }
    }
    
    func runSimulation() {
        if directions.count == steps.count {
            for i in 0..<directions.count {
                let dir = directions[i]
                let stepCount = steps[i]
                move(direction: dir, steps: stepCount)
            }
        }
    }
    
    func move(direction: String, steps: Int) {
        if direction == "up" {
            moveUp(steps: steps)
        } else if direction == "down" {
            moveDown(steps: steps)
        } else if direction == "left" {
            moveLeft(steps: steps)
        } else if direction == "right" {
            moveRight(steps: steps)
        }
    }
    
    func moveUp(steps: Int) {
        for _ in 0..<steps {
            let newY = robotY - 1
            if newY >= 0 {
                if !isObstacle(x: robotX, y: newY) {
                    robotY = newY
                    addCurrentPositionToPath()
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
    
    func moveDown(steps: Int) {
        for _ in 0..<steps {
            let newY = robotY + 1
            if newY < gridSize {
                if !isObstacle(x: robotX, y: newY) {
                    robotY = newY
                    addCurrentPositionToPath()
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
    
    func moveLeft(steps: Int) {
        for _ in 0..<steps {
            let newX = robotX - 1
            if newX >= 0 {
                if !isObstacle(x: newX, y: robotY) {
                    robotX = newX
                    addCurrentPositionToPath()
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
    
    func moveRight(steps: Int) {
        for _ in 0..<steps {
            let newX = robotX + 1
            if newX < gridSize {
                if !isObstacle(x: newX, y: robotY) {
                    robotX = newX
                    addCurrentPositionToPath()
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
    
    func addCurrentPositionToPath() {
        let pos = Position(x: robotX, y: robotY)
        path.append(pos)
    }
    
    func isObstacle(x: Int, y: Int) -> Bool {
        for obstacle in obstacles {
            if obstacle.x == x && obstacle.y == y {
                return true
            }
        }
        return false
    }
    
    func colorForCell(x: Int, y: Int) -> Color {
        if robotX == x && robotY == y {
            return .blue
        } else if isObstacle(x: x, y: y) {
            return .red
        } else {
            var visited = false
            for p in path {
                if p.x == x && p.y == y {
                    visited = true
                }
            }
            if visited {
                return .gray
            } else {
                return .white
            }
        }
    }
}
