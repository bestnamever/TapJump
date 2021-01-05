//
//  ContentView.swift
//  leadership_widgit
//
//  Created by Yu Hong on 2020/12/14.
//

import SwiftUI

struct ContentView: View {
    @State var showView: Bool = false
    @State var leaderboard:Bool = false
    
    var body: some View {
        
        let gradient1 = [Color("gradient2"),Color("gradient3"),Color("gradient4")]
        
        let gradient = [Color("gradient1"),Color("gradient2"),Color("gradient3"),Color("gradient4")]
        
        VStack(){
            if showView{
                ARContentView()
            }
            else{
            VStack{
                Text("Tap Jump").font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.top,40)
                
                Spacer()
                
            }
            .frame(height:UIScreen.main.bounds.height / 3.3)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    
                LinearGradient(gradient: .init(colors: gradient1), startPoint: .top, endPoint: .bottom)
                    .clipShape(CustomShape())
                    
                Button(action:{
                    self.showView = true
                },label:{
                    VStack(spacing:10){
                        Image(systemName: "power")
                            .font(.system(size: 70))
                            .foregroundColor(Color("power"))
                        
                        Text("START")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(50)
                    .background(LinearGradient(gradient: .init(colors: [Color("pgradient1"),Color("pgradient2")]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(Circle())
                    .padding(15)
                    .background(Color("power1").opacity(0.7))
                    .clipShape(Circle())
                    .padding(15)
                    .background(Color("gradient2").opacity(0.7))
                    .clipShape(Circle())
                }
            )
                .offset(y: -65)
                .padding(.bottom,-65)
                
                Spacer()
                
                Button(action: {self.leaderboard = true}, label: {
                    CardView(subTitle: "LeaderBoard")
                        .background(Color.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .foregroundColor(.white)
                        .padding()
                }).padding(.top,300)
                .sheet(isPresented: $leaderboard, content: {
                    JumpView()
                })
            })
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            ZStack{
                LinearGradient(gradient: .init(colors: gradient), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                

                
                Spacer()
                Color.black.opacity(0.1)
                    .ignoresSafeArea(.all,edges: .top)
            }
        )
    }
        
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}

struct JumpView: View {
    var body: some View{
        
        NavigationView{
            VStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ScoresView(number: "1", score: "400")
                        .background(Color.orange.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        .foregroundColor(.white)
                        .padding()
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ScoresView(number: "2", score: "300")
                        .background(Color.orange.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        .foregroundColor(.white)
                        .padding()
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ScoresView(number: "3", score: "200")
                        .background(Color.orange.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                        .foregroundColor(.white)
                        .padding()
                })
            }
            }.navigationTitle("Leaderboards")
        }
    }



