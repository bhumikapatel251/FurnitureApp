//
//  HomeScreen.swift
//  FurnitureApp
//
//  Created by Bhumika Patel on 14/04/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    var body: some View {
        NavigationView {
            ZStack{
                Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
          ScrollView {
            VStack(alignment:.leading){
               AppBarView()
                
                TagLineView()
                    .padding()
                
                SearchAndScanView(search: $search)
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< categories.count) { i in
                            Button(action: {selectedIndex = i}) {
                                CategoryView(isActive: selectedIndex == i, text: categories[i])
                            }
                        }
                    }
                    .padding()
                }
                Text("Popular")
                    .font(.custom("PlayfairDisplay-Bold", size: 24))
                    .padding(.horizontal)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        ForEach(0 ..< 4) { i in
                            NavigationLink(
                                destination: DetailScreen(),
                                label: {
                                    ProductCardView(image: Image("chair_\(i+1)"), size: 210)
                                })
                                .navigationBarHidden(true)
                                .foregroundColor(.black)
                        }
                        .padding(.leading)
                    }
                }
                .padding(.bottom)
                
                Text("Best")
                    .font(.custom("PlayfairDisplay-Bold", size: 24))
                    .padding(.horizontal)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        ForEach(0 ..< 4) { i in
                            ProductCardView(image: Image("chair_\(4-i)"), size: 180)
                        }
                        .padding(.leading)
                        }
                    }
                }
            }
            VStack {
                Spacer()
                BottomNavBarView()
            }
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: #imageLiteral(resourceName: "User"))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}


struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}


struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing, 8)
            
            Button(action: {}) {
                Image("Scan1")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}


struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}


struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Luxury Swedian chair").font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}


struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("home"), action: {})
            Image(systemName: "suit.heart.fill")
                .foregroundColor(.brown)
                .font(.system(size: 25))
                .padding(.leading)
                .padding(.all)
            Image(systemName: "cart.fill")
                .foregroundColor(.brown)
                .font(.system(size: 25))
                .padding(.leading)
                .padding(.all)
        
            BottomNavBarItem(image: Image("User"), action: {})
        }
        //.frame(width: 25, height: 25)
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}
struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}

