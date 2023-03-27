import SwiftUI

struct HashView: View {
    @State private var showData = false
    @State private var addingNumber = false
    @State private var removingNumber = false
    @State private var searchingNumber = false
    @State var Hash = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
    @State var Aviable = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
    @State var num = 0
    @State var new = -1
    @State var hash = -1
    @State var counter = 0
    @ObservedObject var input = NumbersOnly()
    @ObservedObject var input2 = NumbersOnly()
    @ObservedObject var input3 = NumbersOnly()
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
                        Text("Hashing is a technique or process of mapping keys, and values into the hash table by using a hash function. The function used in this example is by division where we take the module of the number introduced divided by ten and then place it in their correspoding place, the collision handling in this particular example is done by linear probing, where if the place that the number is supposed to take is already full it adds one more until it finds an empty space (In case the Bucket is already full the program won't let you add another number), the searching and deleting is done by using the key asigned to the number so you can only use numbers between 0 and 10")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                            .frame(width: 720, height: 750, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(red)
                            .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.top,550)
                    }
                }
                VStack{
                    ScrollView (){
                        HStack{
                            Spacer()
                            VStack{
                                Text(String("New value"))
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Spacer()
                                HStack{
                                    if new == -1 {
                                        Text("New")
                                            .foregroundColor(.black)
                                            .font(.system(size: 40))
                                            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .border(.black)
                                    } else {
                                        Text(String(new))
                                            .foregroundColor(.black)
                                            .font(.system(size: 40))
                                            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .border(.black)
                                    }
                                    Image("arrowR")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                }
                                Spacer()
                            }
                            Spacer()
                            VStack{
                                Text(String("Hashed"))
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Spacer()
                                HStack{
                                    if hash == -1 {
                                        Text("Hash")
                                            .foregroundColor(.black)
                                            .font(.system(size: 40))
                                            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .border(.black)
                                    } else {
                                        Text(String(hash))
                                            .foregroundColor(.black)
                                            .font(.system(size: 40))
                                            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .border(.black)
                                    }
                                    Image("arrowR")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                }
                                Spacer()
                            }
                            Spacer()
                            VStack{
                                VStack{
                                    Text(String("Bucket"))
                                        .foregroundColor(.black)
                                        .font(.system(size: 40))
                                        .frame(width: 150, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                                ForEach(Array(Hash.enumerated()), id: \.offset) { index, number in
                                    VStack{
                                        HStack{
                                            Text(String(index))
                                                .foregroundColor(.black)
                                                .font(.system(size: 30))
                                                .frame(width: 40, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            if number == -1{
                                                Text("")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 40))
                                                    .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .border(.black)
                                            } else if Aviable[index] == 0{
                                                Text(String(number))
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 40))
                                                    .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .border(.red)
                                            } else if Aviable[index] == 1{
                                                Text(String(number))
                                                    .foregroundColor(.green)
                                                    .font(.system(size: 40))
                                                    .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .border(.green)
                                                
                                            } else if Aviable[index] == 2{
                                                Text(String(number))
                                                    .foregroundColor(.blue)
                                                    .font(.system(size: 40))
                                                    .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .border(.blue)
                                            }else{
                                                Text(String(number))
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 40))
                                                    .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .border(.black)
                                            }
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
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
                                removingNumber.toggle()
                            }
                        }, label: { Text("Remove value")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                                .frame(width: 180, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .background(yellow)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        Button(action: {
                            withAnimation(.default) {
                                searchingNumber.toggle()
                            }
                        }, label: { Text("Search value")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                                .frame(width: 180, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                                .font(.system(size: 25))
                                .frame(width: 180, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        })
                    }
                    .background(yellow)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Spacer()
                    HStack{
                        NavigationLink(destination: CreditView()) {
                            Text("Run AR")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                                .frame(width: 180, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                                    if counter != 11 {
                                        counter += 1
                                        hash = Int(input.value)! % 10
                                        Aviable.replaceSubrange(0...Aviable.count-1, with: repeatElement(-1, count: Aviable.count))
                                        while Hash[hash] != -1 {
                                            Aviable[hash] = 0
                                            hash += 1
                                            if hash == Hash.count {
                                                hash = 0
                                            }
                                        }
                                        Aviable[hash] = 1
                                        new = Int(input.value)!
                                        Hash[hash] = (Int(input.value)!)
                                        addingNumber.toggle()
                                    }
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
            if removingNumber{
                VStack{
                    HStack{
                        Text("Delete a number:")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                        TextField("Only numbers between 0 and 10", text: $input2.value)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                    .font(.system(size: 25))
                    }
                    .padding()
                    HStack{
                        Spacer()
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    removingNumber.toggle()
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
                                    Aviable.replaceSubrange(0...Aviable.count-1, with: repeatElement(-1, count: Aviable.count))
                                    if Hash[Int(input2.value)!] != -1 {
                                        counter -= 1
                                        Hash[Int(input2.value)!] = -1
                                    }
                                    new = -1
                                    hash = -1
                                    removingNumber.toggle()
                                }
                            }, label: { Text("Delete")
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
            if searchingNumber{
                VStack{
                    HStack{
                        Text("Give me a key:")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                        TextField("Only numbers between 0 and 10", text: $input3.value)
                                    .padding()
                                    .keyboardType(.decimalPad)
                                    .font(.system(size: 25))
                    }
                    .padding()
                    HStack{
                        Spacer()
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    searchingNumber.toggle()
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
                                    Aviable.replaceSubrange(0...Aviable.count-1, with: repeatElement(-1, count: Aviable.count))
                                    if Hash[Int(input3.value)!] != -1 {
                                        Aviable[Int(input3.value)!] = 2
                                    }
                                    new = -1
                                    hash = -1
                                    searchingNumber.toggle()
                                }
                            }, label: { Text("Search")
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

struct HashView_Previews: PreviewProvider {
    static var previews: some View {
        HashView()
    }
}
