import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    
    private var cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: NSString(string: key))
    }
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
}
