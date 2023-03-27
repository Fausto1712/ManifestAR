import SwiftUI

struct OptionView: View {
    var body: some View {
        ZStack {
            ZStack{ Spacer()}
                .background(celeste)
                .ignoresSafeArea()
            VStack{
                Text(verbatim: "Manifest AR")
                    .font(.system(size: 80))
                    .padding(.bottom,-5)
                Spacer()
                VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            VStack{
                                Text("Binary Tree")
                                    .font(.system(size: 35))
                                NavigationLink(destination: TreeView()) {
                                    Image("forest")
                                        .resizable()
                                        .padding()
                                }
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(yellow)
                                .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                            Spacer()
                            VStack{
                                Text("Linked List")
                                    .font(.system(size: 35))
                                NavigationLink(destination: ListView()) {
                                    Image("link")
                                        .resizable()
                                        .padding()
                                }
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(yellow)
                                .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            VStack{
                                Text("Graph")
                                    .font(.system(size: 35))
                                NavigationLink(destination: GraphView()) {
                                    Image("graph")
                                        .resizable()
                                        .padding()
                                }
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(yellow)
                                .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                            Spacer()
                            VStack{
                                Text("Hash")
                                    .font(.system(size: 35))
                                NavigationLink(destination: HashView()) {
                                    Image("cryptography")
                                        .resizable()
                                        .padding()
                                }
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(yellow)
                                .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            VStack{
                                Text("Stack")
                                    .font(.system(size: 35))
                                NavigationLink(destination: ArrayView()) {
                                    Image("stack")
                                        .resizable()
                                        .padding()
                                }
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(yellow)
                                .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                            Spacer()
                            VStack{
                                Text("Queue")
                                    .font(.system(size: 35))
                                NavigationLink(destination: QueueView()) {
                                    Image("line")
                                        .resizable()
                                        .padding()
                                }
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(yellow)
                                .cornerRadius(30, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                        }
                        Spacer()
                }
                .frame(width: 750, height: 1050, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(grey)
                .cornerRadius(50)
                Spacer()
            }
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
    }
}
