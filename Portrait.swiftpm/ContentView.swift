import SwiftUI
struct ContentView: View {    
var body: some View {
    ZStack {   
    
    Capsule()
        .frame(width: 170, height:250)
        .foregroundStyle(Color.brown)   
    
    Capsule()
        .frame(width:125, height:100)
        .offset(y:-105)
        .offset(x:-40)
        .foregroundStyle(Color.yellow)
    
    Capsule()
        .frame(width:125, height:100)
        .offset(y:-105)
        .offset(x:40)
        .foregroundStyle(Color.yellow)
    Rectangle()
        .frame(width: 80, height: 165)
        .offset(y:175)
        .foregroundStyle(Color.brown)
    
    Rectangle()
        .frame(width:300,height:250)
        .offset(y:350)
        .foregroundStyle(Color.white)
   
    Capsule()
        .frame(width: 25, height:30)
        .foregroundStyle(Color.cyan)
        .offset(y:-25)
        .offset(x:-39)
    
    Capsule()
        .frame(width: 25, height:30)
        .foregroundStyle(Color.cyan)
        .offset(y:-25)
        .offset(x:39)
        }
    }
}
