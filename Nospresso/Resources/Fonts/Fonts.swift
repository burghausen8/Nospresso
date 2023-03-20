import Foundation
import UIKit

struct Fonts {
enum FontType: String {
    case Bold = "OpenSans-Bold"
    case Regular = "OpenSans-Regular"
    case BoldItalic = "OpenSans-BoldItalic"
    case ExtraBoldItalic = "OpenSans-ExtraBoldItalic"
    case Italic = "OpenSans-Italic"
    case Light = "OpenSans-Light"
    case LightItalic = "OpenSans-LightItalic"
    case SemiBold = "OpenSans-SemiBold"
    case SemiBoldItalic = "OpenSans-SemiBoldItalic"
}
static func get(type: FontType, size: CGFloat) -> UIFont{
    return UIFont(name: type.rawValue, size: size)!
}
}
