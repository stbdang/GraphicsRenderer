/*
  Copyright © 03/10/2016 Snippex Ltd

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
 */

#if os(OSX)
    import AppKit
    public typealias GRImage = NSImage
    public typealias Screen = NSScreen

    extension NSScreen {
        public static var mainScreen: NSScreen {
            return NSScreen.main!
        }

        public var scale: CGFloat {
            return backingScaleFactor
        }
    }
    
    extension NSImage {
        public var png: Data? {
            return NSBitmapImageRep(data: tiffRepresentation!)?.representation(using: .png, properties: [:])
        }
        
        public func jpg(quality: CGFloat) -> Data? {
            return NSBitmapImageRep(data: tiffRepresentation!)?.representation(using: .jpeg, properties: [.compressionFactor: quality])
        }
    }
#else
    import UIKit
    public typealias GRImage = UIImage
    public typealias Screen = UIScreen

    extension UIScreen {
        @nonobjc
        public static var mainScreen: UIScreen {
            return .main
        }
    }
    
    extension UIImage {
        public var png: Data? {
            return self.pngData()
        }
        
        public func jpg(quality: CGFloat) -> Data? {
            return self.jpegData(compressionQuality: quality)
        }
    }
#endif

extension CGContext {
    
    internal static var current: CGContext? {
        #if os(OSX)
            return NSGraphicsContext.current?.cgContext
        #else
            return UIGraphicsGetCurrentContext()
        #endif
    }
    
}
