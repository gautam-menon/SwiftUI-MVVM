import SwiftUI

//struct CustomTabBar: View {
//
//    var body: some View {
//        HStack(spacing: 0){
//
//            // Tab Bar Button...
//            TabBarButton(systemName: "person")
//                .background(Color.blue)
//
//            TabBarButton(systemName: "pencil")
//                .background(Color.green)
//
//            Button(action: {}, label: {
//
//                Image(systemName: "plus")
//                    .resizable()
//                    .renderingMode(.template)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width:24, height:24)
//                    .foregroundColor(.white)
//                    .padding(20)
//                    .background(Color("Color"))
//                    .clipShape(Circle())
//                //Shadows
//                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
//                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
//            })
//            .tag("magnifyingglass")
//
//            TabBarButton(systemName: "bell")
//                .background(Color.red)
//            TabBarButton(systemName: "cart")
//                .background(Color.yellow)
//        }
//        .padding(.top)
//        //Decreasing the extra padding added...
//        .padding(.vertical, -0)
//        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
//        .background(Color.white)
//    }
//}

struct CustomTabBar_Previews: PreviewProvider {

    static var previews: some View {
    @State var textValue: String = "2"
        Group {
            CustomTabBar(tagSelect: $textValue)
        }
    }
}

////extending view to get safe area...
//extension View {
//    func getSafeArea()-> UIEdgeInsets {
//        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//}

//struct TabBarButton: View {
//    let systemName: String
//
//    var body: some View{
//        Button(action: {
//        }, label: {
//            VStack(spacing: 8){
//                Image(systemName)
////                    .foregroundColor(.black)
//                    .resizable()
//                    .renderingMode(.template)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width:28, height: 28)
//            }
//            .frame(maxWidth: .infinity)
//        })
//    }
//}
struct CustomTabBar: View {
    @Binding var tagSelect: String
    
    var body: some View {
        VStack (alignment: .leading) {       
            HStack(alignment: .bottom, spacing: 0) {
                TabBarButton(tagSelect: $tagSelect, systemName: "person.fill", title: "Friends")
                TabBarButton(tagSelect: $tagSelect, systemName: "person.2", title: "Groups")
                Button(action: {}, label: {
                    VStack {
                        Image(systemName: "plus")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width:24, height:24)
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Color("Color"))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
                        Text("Add Bill")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .bold()
                    }
                })
                .tag("magnifyingglass")
                TabBarButton(tagSelect: $tagSelect, systemName: "newspaper", title: "Activity")
                TabBarButton(tagSelect: $tagSelect, systemName: "person.crop.square.filled.and.at.rectangle", title: "Me")
            }
            Divider()
        }
        .padding(.bottom,getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
        .background(Color.white.opacity(0.01)) // <-- important
       
    }
}

extension View {
    func getSafeArea()-> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

struct TabBarButton: View {
    @Binding var tagSelect: String
    var systemName: String
    var title:String
    
    var body: some View{
        Button(action: {tagSelect = systemName }, label: {
            VStack(spacing: 8){
                Image(systemName: systemName)
                    .resizable()
                    .foregroundColor(tagSelect==systemName ? .blue : .gray)
//                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:28, height: 28)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
            }
            .frame(maxWidth: .infinity)
        })
    }
}

extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
