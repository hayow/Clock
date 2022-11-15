




import SwiftUI





struct CenterCircle: View {
    let geometry: GeometryProxy
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: geometry.size.width / 15)
            Circle()
                .stroke(Color.black, lineWidth: 5)
                .frame(width: geometry.size.width / 15)
        }
    }
}





struct CenterCircle_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in CenterCircle(geometry: geometry) }
    }
}





