import SwiftUI

struct ContentView: View {
    @State private var report = ""
    
    var body: some View {
        ScrollView {
            Text(report.isEmpty ? "Running..." : report)
                .font(.system(.body, design: .monospaced))
                .padding()
        }
        .onAppear { report = simulate() }
    }
    
    func simulate() -> String {
        var chocolateStock = 12
        var gummyStock = 10
        var lollipopStock = 12
        var caramelStock = 8
        
        let priceChocolateStart = 3
        let priceGummyStart = 2
        let priceLollipopStart = 2
        let priceCaramelStart = 3
        
        var priceChocolate = priceChocolateStart
        var priceGummy = priceGummyStart
        var priceLollipop = priceLollipopStart
        var priceCaramel = priceCaramelStart
        
        var soldChocolate = 0
        var soldGummy = 0
        var soldLollipop = 0
        var soldCaramel = 0
        var cash = 0
        
        func totalStock() -> Int {
            chocolateStock + gummyStock + lollipopStock + caramelStock
        }
        
        func bestSeller() -> String {
            let a = [("Chocolate", soldChocolate), ("Gummy", soldGummy), ("Lollipop", soldLollipop), ("Caramel", soldCaramel)]
            return a.max { $0.1 < $1.1 }?.0 ?? "None"
        }
        
        func lowStockList(_ t: Int) -> [String] {
            var low: [String] = []
            if chocolateStock <= t { low.append("Chocolate") }
            if gummyStock <= t { low.append("Gummy") }
            if lollipopStock <= t { low.append("Lollipop") }
            if caramelStock <= t { low.append("Caramel") }
            return low
        }
        
        var lines: [String] = []
        
        for minute in 1...60 {
            if minute % 15 == 0 {
                priceChocolate = max(1, priceChocolateStart - 1)
                priceGummy = max(1, priceGummyStart - 1)
                priceLollipop = max(1, priceLollipopStart - 1)
                priceCaramel = max(1, priceCaramelStart - 1)
            } else {
                priceChocolate = priceChocolateStart
                priceGummy = priceGummyStart
                priceLollipop = priceLollipopStart
                priceCaramel = priceCaramelStart
            }
            
            if minute % 2 == 0 && gummyStock > 0 {
                gummyStock -= 1; soldGummy += 1; cash += priceGummy
                lines.append("m\(minute): Gummy sold")
            } else if minute % 2 == 0 && gummyStock == 0 {
                lines.append("m\(minute): No Gummy")
            }
            
            if minute % 3 == 0 && lollipopStock > 0 {
                lollipopStock -= 1; soldLollipop += 1; cash += priceLollipop
                lines.append("m\(minute): Lollipop sold")
            } else if minute % 3 == 0 && lollipopStock == 0 {
                lines.append("m\(minute): No Lollipop")
            }
            
            if minute % 5 == 0 {
                if chocolateStock > 0 {
                    chocolateStock -= 1; soldChocolate += 1; cash += priceChocolate
                    lines.append("m\(minute): Chocolate sold")
                } else if caramelStock > 0 {
                    caramelStock -= 1; soldCaramel += 1; cash += priceCaramel
                    lines.append("m\(minute): Caramel sold")
                } else {
                    lines.append("m\(minute): No Chocolate/Caramel")
                }
            }
            
            if minute % 20 == 0 {
                chocolateStock += 2; gummyStock += 2; lollipopStock += 2; caramelStock += 2
                lines.append("m\(minute): Restock +2 each")
            }
            
            if totalStock() <= 10 {
                lines.append("m\(minute): Restock Needed total=\(totalStock())")
            }
        }
        
        let warnings = lowStockList(2)
        lines.append("FINAL REPORT")
        lines.append("Cash: $\(cash)")
        lines.append("Sold  C:\(soldChocolate) G:\(soldGummy) L:\(soldLollipop) Ca:\(soldCaramel)")
        lines.append("Left  C:\(chocolateStock) G:\(gummyStock) L:\(lollipopStock) Ca:\(caramelStock)")
        lines.append(warnings.isEmpty ? "Warnings: None" : "Warnings: " + warnings.joined(separator: ", "))
        lines.append("Best Seller: \(bestSeller())")
        
        return lines.joined(separator: "\n")
    }
}
