




import SwiftUI





struct MinutePointer: View {
    let geometry: GeometryProxy
    var body: some View {
        ZStack(alignment: Alignment.top) {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 1.75)
                .frame(maxWidth: geometry.size.width / 50, maxHeight: geometry.size.width / 4.5)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                }
        }
        .offset(y: -geometry.frame(in: CoordinateSpace.global).midX / 4.5)
    }
}





struct MinutePointer_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            geometry in MinutePointer(geometry: geometry)
                .position(x: geometry.frame(in: CoordinateSpace.global).midX, y: geometry.frame(in: CoordinateSpace.global).midX)
        }
    }
}





