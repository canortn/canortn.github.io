import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Scenario 1: Lunch Money Calculator")
                .font(.title2)
            Text(totalMessage)
        }
        .padding()
    }
    
    var totalMessage: String {
        let sandwichPrice: Double = 4.50
        let drinkPrice: Double = 2.25
        let dessertPrice: Double = 3.00
        
        let subtotal = sandwichPrice + drinkPrice + dessertPrice
        let taxRate = 0.08
        let taxAmount = subtotal * taxRate
        var total = subtotal + taxAmount
        
        let hasStudentDiscount = true
        if hasStudentDiscount {
            let discountRate = 0.10
            let discountAmount = total * discountRate
            total -= discountAmount
        }
        
        return "Your lunch total is $\(total)"
    }
}
