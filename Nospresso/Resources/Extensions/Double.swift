import Foundation

extension Double {
    
    var toMoney: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pt-BR")
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
}
