import SwiftUI

struct CreditView: View {
    var body: some View {
        ZStack {
            ZStack{ Spacer()}
                .background(grey)
                .ignoresSafeArea()
            ZStack{ Spacer()}
                .background(celeste)
                .frame(width: 700, height: 1050, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack{
                Text(verbatim: "Manifest AR")
                    .font(.system(size: 100))
                    .padding(.bottom,-2)
                VStack{
                    Text("Hello my name is Fausto Pinto Cabrera and I'm passionate about programming, I have programmed now for over 3 years and I still can't get enough of it but many times I find topics that are kinda hard to assimilate even after you have read about it over and over and since Im mostly a visual learner sometimes this can get very frustrating.")
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .padding(.bottom)
                        .padding(.top)
                        .font(Font.system(size: 28).bold())
                    Text("The main purpose for this project is to make this whole process of learning a lot easier for every one, using AR and elegant coding  to give a unique solution.")
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .padding(.bottom)
                        .font(Font.system(size: 28).bold())
                    Text("This app aims not only to be a learning tool but also something programmer can use everyday, as I was learning this data structures I would always write this on my notebook and then iterate like a computer would but by hand, here I can have the same visual representation but automated and in a fun way.")
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .padding(.bottom)
                        .font(Font.system(size: 28).bold())
                    Text("Thanks for giving it a try and I hope you gain something from this project of mine, cheers!")
                        .padding(.leading,30)
                        .padding(.trailing,30)
                        .font(Font.system(size: 28).bold())
                    Spacer()
                }
                .padding()
                .background(blue)
                .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .frame(width: 650, height: 850, alignment: .center)
                .font(.system(size: 25))
            }
        }
        .background(grey)
        .ignoresSafeArea()
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
