import SwiftUI

struct Tree<A> {
    var value: A
    var left: [Tree<A>] = []
    var right: [Tree<A>] = []
    init(_ value: A, left: [Tree<A>] = [],right: [Tree<A>] = []) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension Tree {
    func map<B>(_ transform: (A) -> B) -> Tree<B> {
        return Tree<B>(transform(value), left: left.map({ $0.map(transform) }), right: right.map({ $0.map(transform) }))
    }
}

class Unique<A>: Identifiable {
    let value: A
    init(_ value: A) { self.value = value }
}

struct CollectDict<Key: Hashable, Value>: PreferenceKey {
    static var defaultValue: [Key:Value] { [:] }
    static func reduce(value: inout [Key:Value], nextValue: () -> [Key:Value]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

extension CGPoint: VectorArithmetic {
    public static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    public mutating func scale(by rhs: Double) {
        x *= CGFloat(rhs)
        y *= CGFloat(rhs)
    }
    
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public var magnitudeSquared: Double { return Double(x*x + y*y) }
}

struct Line: Shape {
    var from: CGPoint
    var to: CGPoint
    var animatableData: AnimatablePair<CGPoint, CGPoint> {
        get { AnimatablePair(from, to) }
        set {
            from = newValue.first
            to = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: self.from)
            p.addLine(to: self.to)
        }
    }
}

struct Diagram<A: Identifiable, V: View>: View {
    let tree: Tree<A>
    let node: (A) -> V
    
    typealias Key = CollectDict<A.ID, Anchor<CGPoint>>

    var body: some View {
        VStack(alignment: .center) {
            node(tree.value)
               .anchorPreference(key: Key.self, value: .center, transform: {
                   [self.tree.value.id: $0]
               })
            HStack(alignment: .bottom, spacing: 10) {
                ForEach(tree.left, id: \.value.id, content: { child in
                    Diagram(tree: child, node: self.node)
                })
                ForEach(tree.right, id: \.value.id, content: { child in
                    Diagram(tree: child, node: self.node)
                })
            }
        }.backgroundPreferenceValue(Key.self, { (centers: [A.ID: Anchor<CGPoint>]) in
            GeometryReader { proxy in
                ForEach(self.tree.left, id: \.value.id, content: {
                 child in
                    Line(
                        from: proxy[centers[self.tree.value.id]!],
                        to: proxy[centers[child.value.id]!])
                    .stroke()
                })
                
                ForEach(self.tree.right, id: \.value.id, content: {
                 child in
                    Line(
                        from: proxy[centers[self.tree.value.id]!],
                        to: proxy[centers[child.value.id]!])
                    .stroke()
                })
            }
        })
    }
}

struct RoundedCircleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .background(Circle().stroke())
            .background(Circle().fill(Color.white))
            .font(.system(size: 30))
            .padding(10)
    }
}

extension Tree where A == Unique<Int> {
    mutating func insert(_ number: Int) {
        if number < value.value {
            if left.count == 0 {
                left.append(Tree(Unique(number)))
            } else {
                left[0].insert(number)
            }
        } else {
            if right.count == 0 {
                right.append(Tree(Unique(number)))
            } else {
                right[0].insert(number)
            }
        }
    }
}

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct TreeView: View {
    @State private var showData = false
    @State private var addingNumber = false
    @State var tree = Tree<Int>(50).map(Unique.init)
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
                        Text("A binary tree is a structure where we have a starting node and each node can have anywhere between 0 and 2 “children” which are connections to other nodes, the most common use of this is dividing the tree depending whether the number inserted is bigger or smaller than the one at the top.")
                            .foregroundColor(.black)
                            .font(.system(size: 38))
                            .frame(width: 720, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(red)
                            .cornerRadius(50, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .padding(.top,250)
                    }
                }
                VStack{
                    Diagram(tree: tree, node: { value in
                        Text("\(value.value)")
                            .modifier(RoundedCircleStyle())
                    })
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
                                addingNumber.toggle()
                            }
                        }, label: { Text("Add number")
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
                                    self.tree.insert(Int(input.value)!)
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

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView()
    }
}
