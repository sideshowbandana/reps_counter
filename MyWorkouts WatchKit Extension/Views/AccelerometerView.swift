/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The elapsed time.
*/

import SwiftUI
import CoreMotion

struct AccelerometerView: View {
    var acceleration: CMAcceleration?
    @State private var accelerometerFormatter = AccelerometerFormatter()

    var body: some View {
        Text("\(acceleration, format: AccelerometerFormatter())")
            //.fontWeight(.semibold)
    }
}

struct AccelerometerFormatter: FormatStyle {
    func format(_ data: CMAcceleration?) -> String {
        guard let data else { return "" }
        let str = "x: \(data.x) y: \(data.y) z: \(data.z)"
        print(str)
        return str
    }
}

extension CMAcceleration: Equatable {
    public static func == (lhs: CMAcceleration, rhs: CMAcceleration) -> Bool {
        false
    }
    
    
}

struct Accelerometer_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerView()
    }
}
