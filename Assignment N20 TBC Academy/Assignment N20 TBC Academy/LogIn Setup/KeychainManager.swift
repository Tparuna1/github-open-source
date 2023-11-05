
import Foundation
import Security

class KeychainManager {
    
    // MARK: - Save User Credentials
    
    static func saveUserCredentials(username: String, password: String) {
        if retrieveUserCredentials(username: username) != nil {
            updateUserCredentials(username: username, password: password)
        } else {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: username,
                kSecValueData as String: password.data(using: .utf8)!,
            ]
            
            let status = SecItemAdd(query as CFDictionary, nil)
            if status == errSecSuccess {
                print("Credentials saved successfully.")
            } else {
                print("Error saving credentials: \(status)")
            }
        }
    }
    
    // MARK: - Retrieve User Credentials
    
    static func retrieveUserCredentials(username: String) -> (String, String)? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne,
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess, let data = result as? Data, let password = String(data: data, encoding: .utf8) {
            return (username, password)
        } else {
            return nil
        }
    }
    
    // MARK: - Update User Credentials
    
    static func updateUserCredentials(username: String, password: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
        ]
        
        let attributes: [String: Any] = [
            kSecValueData as String: password.data(using: .utf8)!,
        ]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        if status == errSecSuccess {
            print("Credentials updated successfully.")
        } else {
            print("Error updating credentials: \(status)")
        }
    }
}

