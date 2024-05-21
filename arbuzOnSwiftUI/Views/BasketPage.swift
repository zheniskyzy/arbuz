//
//  BasketPage.swift
//  arbuzOnSwiftUI
//
//  Created by Madina Olzhabek on 16.05.2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct ProductForBasket: Identifiable {
    var id = UUID()
    var image = ""
    var name: String = ""
    var price: String = ""
    var addedCount = 0
}

struct BasketPage: View {

    var body: some View {
        VStack {
            CollectionComponent()

            Button("CheckOut") {
                print("tapped")
                NavigationView {
                    NavigationLink(destination: HelloWorldView()) {
                        Text("Hi")
                    }
                }
                
            }
        }
            
    }
}

#Preview {
//    BasketPage(basketArray: AppData())
    BasketPage()

}

struct CollectionComponent : UIViewRepresentable {

    func makeCoordinator() -> CollectionComponent.Coordinator {
       
        return Coordinator()

    }

    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

//        @StateObject  var basket = AppData()
//        @ObservedObject  var basket = AppData()
        
        var productB: [ProductForBasket] = [
            ProductForBasket(image: "https://img.freepik.com/free-photo/falling-watermelon-slices-isolated-white-background_123827-29643.jpg?t=st=1715926808~exp=1715930408~hmac=3ea08e65591f9f4c64dfb0a5243af6e70a38029b5b44e6d2b0bb43b16369572e&w=1480", name: "Watermelon", price: "1200 тг", addedCount: 7),
            ProductForBasket(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Grapefruits_-_whole-halved-segments.jpg/550px-Grapefruits_-_whole-halved-segments.jpg", name: "GrapeFruit", price: "1000 тг", addedCount: 5),
            ProductForBasket(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Oranges_-_whole-halved-segment.jpg/600px-Oranges_-_whole-halved-segment.jpg", name: "Orange", price: "700 тг", addedCount: 7)]
        
       private var sum = 0
        
        func summ(int: Int) {
            sum += int
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            basketArray.selectedProduct.count
            productB.count
            
            
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GenericCell
            cell.customView.rootView = AnyView(
//                Text(data[indexPath.item]).font(Font.title).border(Color.red)
                
//                VStack{
//                    Text("aaaaaa \(basket.arrayOfProducts.count)").bold().foregroundStyle(.blue)
////                    WebImage(url: URL(string: basket.arrayOfProducts[indexPath.item].image))
////                        .frame(width: 100, height: 100)
////
//                }
                
                VStack{
                    BasketRow(product: productB[indexPath.item])
                   
                }
            )
           
            return cell
        }
    }
       
        


    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = context.coordinator
        cv.delegate = context.coordinator
        cv.register(GenericCell.self, forCellWithReuseIdentifier: "cell")

        cv.backgroundColor = .white
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return cv
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {

    }
        
}

open class GenericCell: UICollectionViewCell {
    
    public var customView = UIHostingController(rootView: AnyView(Text("")))

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    private func configure() {
        contentView.addSubview(customView.view)
        customView.view.preservesSuperviewLayoutMargins = false
        customView.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            customView.view.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            customView.view.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor, constant: -200),
            customView.view.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            customView.view.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        ])
     
    }
}

struct BasketRow: View {
    var product: ProductForBasket
    
    var body: some View {
        VStack {
           HStack {
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(12)
                    .scaleEffect()
                
                VStack{
                    Text(product.name)
                        .font(.headline)
                    Text(product.price)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .bold()
                }
            }
           
        }
    }
}
