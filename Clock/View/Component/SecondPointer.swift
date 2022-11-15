




import SwiftUI





struct SecondPointer: View {
    let geometry: GeometryProxy
    var body: some View {
        
        ZStack(alignment: Alignment.top) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1.5)
                .frame(maxWidth: geometry.size.width / 100, maxHeight: geometry.size.width / 4)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                }
        }
        .offset(y: -geometry.frame(in: CoordinateSpace.global).midX / 4)
    }
}





struct SecondPointer_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            geometry in SecondPointer(geometry: geometry)
                .position(x: geometry.frame(in: CoordinateSpace.global).midX, y: geometry.frame(in: CoordinateSpace.global).midX)
        }
    }
}





