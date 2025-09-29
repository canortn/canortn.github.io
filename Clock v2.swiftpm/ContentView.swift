import SwiftUI
struct ContentView: View {
    @State var hour=0
    @State var minuteSeg=0
    
    var hourAngle:Double{
        let h=hour%12
        return (h==0 && minuteSeg==0) ? 0 : Double(h)*30+Double(minuteSeg)*7.5
    }
    var body: some View {
        ZStack{
            (hour<12 ? Color.white : Color.gray).ignoresSafeArea()
            
            VStack(spacing:16){
                Text("Time: \(hour)")
                    .foregroundColor(hour<12 ? .black : .white)
                
                HStack(spacing:20){
                    
                    Circle()
                        .fill(.black)
                        .overlay(Circle()
                            .stroke(.black,lineWidth:4))
                        .offset(y:70).frame(width:150,height:100)
                    
                    Circle()
                        .fill(.black)
                        .overlay(Circle()
                            .stroke(.black,lineWidth:4))
                        .offset(y:70)
                        .frame(width:150,height:100)
                }
                
                ZStack{
                    if hour<12{
                        
                        Circle()
                            .fill(.white)
                            .overlay(Circle()
                                .stroke(.black,lineWidth:4))
                            .frame(width:200,height:200)
                        
                        Ellipse()
                            .fill(.yellow)
                            .frame(width:30,height:80)
                            .offset(x:43,y:-25)
                        
                        Ellipse().fill(.yellow)
                            .frame(width:30,height:80)
                            .offset(x:-43,y:-25)
                    }else{
                        
                        Circle().fill(.white)
                            .overlay(Circle()
                                .stroke(.black,lineWidth:4))
                            .frame(width:200,height:200)
                        
                        Ellipse().fill(.blue)
                            .frame(width:30,height:80)
                            .offset(x:43,y:-25)
                        
                        Ellipse().fill(.blue)
                            .frame(width:30,height:80)
                            .offset(x:-43,y:-25)
                    }
                    
                    Group{
                        if minuteSeg==0{
                            
                            Rectangle().fill(.black).frame(width:5,height:80).offset(x:0,y:-43)
                        }else if minuteSeg==1{
                            
                            Rectangle().fill(.black).frame(width:80,height:5).offset(x:43,y:0)
                        }else if minuteSeg==2{
                            
                            Rectangle().fill(.black).frame(width:5,height:80).offset(x:0,y:43)
                        }else{
                            
                            Rectangle().fill(.black).frame(width:80,height:5).offset(x:-43,y:0)
                        }
                    }
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width:8,height:40)
                        .offset(x:0,y:-25)
                        .rotationEffect(.degrees(hourAngle))
                    Circle()
                        .fill(.black)
                        .frame(width:10,height:10)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width:50,height:5)
                        .offset(x:0,y:52)
                    Rectangle()
                        .fill(.black)
                        .frame(width:17,height:7)
                        .offset(x:20,y:49)
                    Rectangle()
                        .fill(.black)
                        .frame(width:17,height:7)
                        .offset(x:-20,y:49)
                    Rectangle()
                        .fill(.black)
                        .frame(width:10,height:4)
                        .offset(x:20,y:53)
                    Rectangle()
                        .fill(.black)
                        .frame(width:10,height:4)
                        .offset(x:-20,y:53)
                    Rectangle()
                        .fill(.black)
                        .frame(width:30,height:5)
                        .offset(x:0,y:55)
                }
                .onTapGesture{
                    minuteSeg+=1
                    if minuteSeg==4{minuteSeg=0;hour+=1}
                    if hour==24{hour=0}
                }
                HStack(spacing:12){
                    Button("- Hour"){ hour = (hour+23)%24 }
                    Button("+ Hour"){ hour = (hour+1)%24 }
                    Button("Next Minute"){
                        minuteSeg = (minuteSeg+1)%4
                    }
                }
            }
            .padding()
        }
    }
    
}

