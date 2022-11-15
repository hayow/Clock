




import SwiftUI





struct MinuteMarker: View {
    
    let geometry: GeometryProxy
    var body: some View {
        ZStack {
            ForEach(0..<60) { marker in
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(marker % 5 == 0 ? Color.clear: Color.black, lineWidth: 1.5)
                        .frame(maxWidth: geometry.size.width / 75, maxHeight: geometry.size.width / 18)
                        .offset(y: geometry.frame(in: CoordinateSpace.global).midX / 1.4)
                }
                .rotationEffect(Angle(degrees: Double(marker * 6)))
            }
        }
    }
}





struct MinuteMarker_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader {
            geometry in MinuteMarker(geometry: geometry)
                .position(x: geometry.frame(in: CoordinateSpace.global).midX, y: geometry.frame(in: CoordinateSpace.global).midX)
        }
    }
}





