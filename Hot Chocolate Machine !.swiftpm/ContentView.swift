import SwiftUI

struct ContentView: View {
    @State private var log: [String] = []
    var body: some View {
        VStack(spacing: 12) {
            Text("Hot Chocolate Machine").font(.title2)
            Button("Start Heating") {
                log = hotChocolateMachine()
            }
            List(log, id: \.self) { Text($0) }
        }
        .padding()
    }
}

func hotChocolateMachine() -> [String] {
    let startTemp = 20
    var currentTemp = startTemp
    var out: [String] = []
    for minute in 1...20 {
        currentTemp += 5
        out.append("Minute \(minute): \(currentTemp)°C")
        if currentTemp < 50 {
            out.append("→ The drink is still cold.")
        } else if currentTemp <= 70 {
            out.append("→ The drink is ready to serve!")
        } else if currentTemp <= 80 {
            out.append("→ Too hot! Wait before drinking.")
        } else {
            out.append("⚠ Machine auto-stop activated!")
            break
        }
    }
    let totalChange = currentTemp - startTemp
    out.append("Total temperature change: \(totalChange)°C")
    return out
}
