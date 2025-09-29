import SwiftUI
struct ContentView: View {
    @State var hour=13
    @State var minuteSeg=0
    var hourAngle: Double {
        var h = hour % 12
        var base = Double(h) * 30
        var step = Double(minuteSeg) * 7.5
        return (h == 0 && minuteSeg == 0) ? 0 : base + step
    }

var body: some View {
    VStack(spacing:16){
        Text("Time: \(hour)")
        ZStack{
            if hour<12{
                
                Circle()
                    .fill(.yellow)
                    .opacity(0.8)
                    .overlay(Circle()
                        .stroke(.white,lineWidth:4))
                    .frame(width:200,height:200)
            }else{
                
                Circle()
                    .fill(.blue)
                    .opacity(0.8)
                    .overlay(Circle()
                        .stroke(.white,lineWidth:4))
                    .frame(width:200,height:200)
            }
            Group{
                if minuteSeg==0{
                    Rectangle()
                        .fill(.white)
                        .frame(width:5,height:80)
                        .offset(x:0,y:-43)
                }else if minuteSeg==1{
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width:80,height:5)
                        .offset(x:43,y:0)
                }else if minuteSeg==2{
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width:5,height:80)
                        .offset(x:0,y:43)
                }else{
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width:80,height:5)
                        .offset(x:-43,y:0)
                }
            }
            Circle()
                .fill(.white)
                .frame(width:10,height:10)
            
            Rectangle()
                .fill(.white)
                .frame(width:8,height:40)
                .offset(x:0,y:-25)
                .rotationEffect(.degrees(hourAngle))
        }
        .onTapGesture{
            minuteSeg+=1
            if minuteSeg==4{minuteSeg=0;hour+=1}
            if hour==24{hour=0}
        }
    }
    .padding()
}
}

