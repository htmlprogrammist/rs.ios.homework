import UIKit

class MessageDecryptor: NSObject {
    func decryptMessage(_ message: String) -> String {
        var cin = message
        var cout: String = ""
        
        while cin.count > 0 {
            var item = String(cin.prefix(while: {$0 != "["}))
            if let multiplier = Int(item) {
                let firstRange = cin.range(of: item)
                cin = cin.replacingCharacters(in: firstRange!, with: "")
                
                let subMessage = getSubMessage(message: cin)
                let decryprted = decryptMessage(subMessage)
                
                cout.append(String(repeating: decryprted, count: multiplier))
                
                let secondRange = cin.range(of: subMessage)
                cin = cin.replacingCharacters(in: secondRange!, with: "")
            } else {
                item = String(cin.first!)
                if item != "]" && item != "[" {
                    cout.append(item)
                }
                cin = String(cin.dropFirst())
            }
        }
        return cout
    }
    
    func getSubMessage(message: String) -> String {
        var subMessage = ""
        var counter = 0
        
        for symbol in message {
            subMessage.append(symbol)
            if symbol != "]" {
                if symbol == "[" {
                    counter += 1
                }
            } else {
                counter -= 1
                if counter == 0 {
                    break
                }
            }
        }
        return subMessage
    }
}
