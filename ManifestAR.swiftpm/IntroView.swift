import SwiftUI

let grey = Color("#E7EDEA")
let yellow = Color("#FFC52C")
let red = Color("#FB0C06")
let blue = Color("#030D4F")
let celeste = Color("#CEECEF")

struct IntroView: View {
    var body: some View {
        NavigationView{
            ZStack {
                ZStack{ Spacer()}
                    .background(grey)
                    .ignoresSafeArea()
                ZStack{ Spacer()}
                    .background(celeste)
                    .frame(width: 700, height: 1050, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack{
                    Spacer()
                    Text(verbatim: "Manifest AR")
                        .font(.system(size: 100))
                        .padding(.bottom,-5)
                    Text("Welcome to Manifest AR, the main purpose of this app is to help you understand basic data structures that are very common in day to day programming.")
                        .frame(width: 650, height: 180, alignment: .center)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                    VStack{
                        Text("What can you do here?")
                            .padding(.top)
                            .font(Font.system(size: 25).bold())
                        Text("Here I present to you a couple of the most popular and useful data structures for programming, you can create a data structure with the data you give and then see a visual representation on how the computer will follow it, this will help you understand the flow.")
                            .padding(.leading,10)
                            .padding(.bottom)
                            .padding(.trailing,10)
                        Text("Never programmed before?")
                            .font(Font.system(size: 25).bold())
                        Text("No problem! this app has a explanation of each one of the data structures and a representation of how they work, you don´t need to know any programming at all or research anything before getting started.")
                            .padding(.leading,10)
                            .padding(.bottom)
                            .padding(.trailing,10)
                        Text("What else is in here for me?")
                            .font(Font.system(size: 25).bold())
                        Text("This app is not just for beginners, Manifest AR has the purpose to help you debug your code and see exactly how the flow is going.")
                            .padding(.leading,10)
                            .padding(.bottom)
                            .padding(.trailing,10)
                    }
                    .background(blue)
                    .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .frame(width: 650, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25))
                    HStack{
                        Spacer()
                        HStack{
                            NavigationLink(destination: OptionView()) {
                                Text("Begin!")
                                    .foregroundColor(.black)
                                    .font(.system(size: 50))
                                    .frame(width: 250, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                        }
                        .background(yellow)
                        .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        Spacer()
                        HStack{
                            NavigationLink(destination: CreditView()) {
                                Text("Credits")
                                    .foregroundColor(.black)
                                    .font(.system(size: 50))
                                    .frame(width: 250, height: 110, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                        }
                        .background(red)
                        .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                }
            }
            .background(grey)
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

extension Color {
    init?(_ hex: String) {
        var str = hex
        if str.hasPrefix("#") {
            str.removeFirst()
        }
        if str.count == 3 {
            str = String(repeating: str[str.startIndex], count: 2)
            + String(repeating: str[str.index(str.startIndex, offsetBy: 1)], count: 2)
            + String(repeating: str[str.index(str.startIndex, offsetBy: 2)], count: 2)
        } else if !str.count.isMultiple(of: 2) || str.count > 8 {
            return nil
        }
        guard let color = UInt64(str, radix: 16)
        else {
            return nil
        }
        if str.count == 2 {
            let gray = Double(Int(color) & 0xFF) / 255
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
        } else if str.count == 4 {
            let gray = Double(Int(color >> 8) & 0x00FF) / 255
            let alpha = Double(Int(color) & 0x00FF) / 255
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
        } else if str.count == 6 {
            let red = Double(Int(color >> 16) & 0x0000FF) / 255
            let green = Double(Int(color >> 8) & 0x0000FF) / 255
            let blue = Double(Int(color) & 0x0000FF) / 255
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
        } else if str.count == 8 {
            let red = Double(Int(color >> 24) & 0x000000FF) / 255
            let green = Double(Int(color >> 16) & 0x000000FF) / 255
            let blue = Double(Int(color >> 8) & 0x000000FF) / 255
            let alpha = Double(Int(color) & 0x000000FF) / 255
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
        } else {
            return nil
        }
    }
}
