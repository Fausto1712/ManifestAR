import SwiftUI

struct ArrayView: View {
    @State private var showData = false
    @State private var addingNumber = false
    @State var Queue = [0]
    @State var num = 0
    @ObservedObject var input = NumbersOnly()
    var body: some View {
        ZStack {
            ZStack{ Spacer()}
                .background(celeste)
                .ignoresSafeArea()
            VStack{
                if !showData {
                    Button{
                        showData.toggle()
                    } label: {
                        Text("Click me for more info!")
                            .foregroundColor(.black)
                            .font(.system(size: 50))
                            .frame(width: 500, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(yellow)
                            .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.bottom,30)
                    }
                } else{
                    Button{
                        showData.toggle()
                    } label: {
                        Text("Stack is a linear data structure that follows a particular order in which the operations are performed. Usually this order states that the last element to be placed is the first one to be taken, you can think of it as a pile of plates where you take the plates one by one from the top")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                            .frame(width: 720, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(red)
                            .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.top,250)
                    }
                }
                VStack{
                    ScrollView (){
                        VStack{
                            VStack{
                                Text(String("In/Out"))
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .border(.black)
                                    .padding()
                                Image("arrowS")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            }
                            ForEach(Array(Queue.enumerated()), id: \.offset) { index, number in
                                VStack{
                                    Text(String(number))
                                        .foregroundColor(.black)
                                        .font(.system(size: 40))
                                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .border(.black)
                                    Image("arrowD")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                }
                            }
                            VStack{
                                Text(String("Bottom of stack"))
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 250, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .border(.black)
                            }
                        }
                        .frame(minWidth: 800)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .foregroundColor(.black)
                .font(.system(size: 50))
                .frame(width: 800, height: 800, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(grey)
                .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                HStack{
                    Spacer()
                    HStack{
                        Button(action: {
                            withAnimation(.default) {
                                if !Queue.isEmpty{
                                    num = Queue.removeFirst()
                                }
                            }
                        }, label: { Text("Remove value")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                                .frame(width: 250, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .background(yellow)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        Button(action: {
                            withAnimation(.default) {
                                addingNumber.toggle()
                            }
                        }, label: { Text("Add value")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                                .frame(width: 250, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .background(yellow)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        NavigationLink(destination: CreditView()) {
                            Text("Run AR")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                                .frame(width: 250, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .background(red)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                .padding(.top,20)
            }
            if addingNumber{
                VStack{
                    HStack{
                        Text("Insert a new number:")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                        TextField("Example 5", text: $input.value)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                    .font(.system(size: 38))
                    }
                    .padding()
                    HStack{
                        Spacer()
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    addingNumber.toggle()
                                }
                            }, label: { Text("Cancel")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                        }
                        .background(grey)
                        .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        Spacer()
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    Queue.insert(Int(input.value)!,at:0)
                                    addingNumber.toggle()
                                }
                            }, label: { Text("Insert")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            })
                        }
                        .background(red)
                        .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        Spacer()
                    }
                }
                .background(Color.white)
                .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(50)
            }
        }
    }
}

struct ArrayView_Previews: PreviewProvider {
    static var previews: some View {
        ArrayView()
    }
}
