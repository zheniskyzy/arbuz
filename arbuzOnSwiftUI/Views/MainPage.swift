//
//  MainPage.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 16.05.2024.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct MainPage: View {
    @ObservedObject var productList = GetProduct()
    
    var productH: ProductForHeader
    
    var body: some View {
        
        ScrollView{
            LazyHStack {
                HeaderOfProductCard(productForHeader: productH)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            .background(Color.lightYellow)
            .cornerRadius(12)
           
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]){
                ForEach(productList.productArray) { product in
                    ProductVerticalRow(product: product)
                        .padding(.vertical, 10)
                }
            }
            
            Text("Горизонтальный вид")
                .font(.footnote)
                .bold()
                .foregroundStyle(.gray)
                
            
            ScrollView(.horizontal){
                LazyHStack {
                    ForEach(productList.productArray) {
                        product in ProductHorizontalRow(product: product)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 20)
                    }
                }
            }
            .background(Color.lightGreen)
            
        }
                     
    }
}

//#Preview {
//    MainPage()
//}

// MARK: netWork
 
class GetProduct: ObservableObject {
    @Published var productArray = [Product]()
    
    init() {
        updateData()
    }
    
    func updateData() {
        let urlString = "https://demo4031576.mockable.io/arbuzProduct"
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url!) { data, _, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            let json = JSON(data!)
            
            if let resultArray = json.array{
                self.productArray.removeAll()
                for item in resultArray{
                    let productItem = Product(json: item)
                    print("hello")
                    DispatchQueue.main.async {
                        self.productArray.append(productItem)
                        print("dispatch")
                    }
                }
            }
        }.resume()
    }
}
