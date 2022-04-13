
import SwiftUI

#if os(iOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#endif

public extension Image {
    init(grImage: GRImage) {
#if os(iOS)
        self.init(uiImage: grImage)
#elseif os(OSX)
        self.init(nsImage: grImage)
#endif
    }
}
