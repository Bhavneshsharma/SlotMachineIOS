//
//  ContentView.swift
//  SloatMachineIOS
//
//  Created by Bhavnesh Sharma on 12/09/23.
//

import SwiftUI

enum Choice : Int, Identifiable {
    var id: Int{
        rawValue
    }
    case success, failure
}

struct ContentView: View {
    @State public var symnols = ["eating","love","scary","sleeping"]
    @State public var numbers = [0,1,2,3]
    @State public var counter = 0
    @State private var showingAlert : Choice?
    @State private var remainTry = 9
    
    var body: some View {
        ZStack{
            ScrollView{
                ZStack{
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: UIScreen.main.bounds.height)
                    VStack(alignment: .center, spacing: 80){
                        HStack{
                            Image("fire")
                                .resizable()
                                .scaledToFit()
                                .shadow(color: .orange, radius: 1, y: 3)
                            Text("Slot Machine")
                                .font(.system(size: 30))
                                .fontWeight(.black)
                                .shadow(color: .orange, radius: 1, y: 3)
                            Image("fire")
                                .resizable()
                                .scaledToFit()
                                .shadow(color: .orange, radius: 1, y: 3)
                        }.frame(width: .infinity, height: 50, alignment: .center)
                        Text("Spin left \(remainTry)")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .shadow(color: .orange, radius: 1, y: 3)
                        VStack(spacing: 15){
                            HStack(spacing: 35){
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[0]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[1]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[2]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                            }
                            HStack(spacing: 35){
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[3]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[0]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                            }
                            HStack(spacing: 35){
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[1]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[2]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                                HeaxaShape()
                                    .fill(Color.white)
                                    .opacity(0.8)
                                    .frame(width: 100, height: 120, alignment: .center)
                                    .overlay(
                                    Image(symnols[numbers[3]])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80,height: 70,alignment: .center)
                                        .shadow(color: .gray, radius: 4, x: 4, y: 5)
                                    )
                            }
                        }
                        Button {
                            self.numbers[0] = Int.random(in: 0...self.symnols.count - 1)
                            self.numbers[1] = Int.random(in: 0...self.symnols.count - 1)
                            self.numbers[2] = Int.random(in: 0...self.symnols.count - 1)
                            self.numbers[3] = Int.random(in: 0...self.symnols.count - 1)
                            
                            remainTry -= 1
                            counter += 1
                            
                            if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] &&
                                self.numbers[2] == self.numbers[3] &&
                                self.numbers[3] == self.numbers[1]{
                                self.showingAlert = .success
                                counter = 0
                                remainTry = 9
                            }
                            if counter > 9 {
                                self.showingAlert = .failure
                                counter = 0
                                remainTry = 9
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("app_yellow"))
                                .overlay(Text("Spin")
                                    .fontWeight(.black)
                                    .font(.title3)
                                )
                                .foregroundColor(.black)
                                .frame(width: 200, height: 40 , alignment: .center)
                                .shadow(color: .gray, radius: 1,y: 4)
                        }

                    }
                    .alert(item: $showingAlert){ alert -> Alert in
                        switch alert{
                        case .success :
                            return Alert(title: Text("Yahhh! you won"), message: Text("Born with the charm"), dismissButton: .cancel())
                        case .failure :
                            return Alert(title: Text("Oooopppss !"), message: Text("Better luck next time"), dismissButton: .cancel())
                        }
                        
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
