import SwiftUI
struct ContentView: View {
    let cities = [
        "🇬🇧 London",
        "🇹🇷 Istanbul",
        "🇺🇸 New York",
        "🇯🇵 Tokyo",
        "🇫🇷 Paris",
        "🇦🇺 Sydney"
    ]    
    var body: some View {
        NavigationView {
            List(cities, id: \.self) { city in
                Text(city)
                    .font(.title2)        .padding(.vertical, 4)
            }
            .navigationTitle("World Clock V1")
        }
    }
}
