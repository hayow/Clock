




import SwiftUI





struct HourPointer: View {
    let geometry: GeometryProxy
    var body: some View {
        
        ZStack(alignment: Alignment.top) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 3)
                .frame(maxWidth: geometry.size.width / 25, maxHeight: geometry.size.width / 5)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                }
        }
        .offset(y: -geometry.frame(in: CoordinateSpace.global).midX / 5)
    }
}





struct HourPointer_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            geometry in HourPointer(geometry: geometry)
                .position(x: geometry.frame(in: CoordinateSpace.global).midX, y: geometry.frame(in: CoordinateSpace.global).midX)
        }
    }
}





