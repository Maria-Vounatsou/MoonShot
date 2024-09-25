//
//  Bundle-Decodable.swift
//  HWS_Moonshot
//
//  Created by Vounatsou, Maria on 2/7/24.
//

import Foundation

extension Bundle {
    
    //Use of constraint (<T: Codable>) so swift knows T can be whatever we want, as long as that thing conforms to Codable
    func decode<T: Codable>(_ file: String) -> T {
        // Locate the file in the bundle
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // Load the data from the file into a Data object
        guard let data = try?  Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // Create a JSONDecoder
        let decoder = JSONDecoder()
        
        // Configure the date decoding strategy
        //A DateFormatter is set up to handle date strings in the JSON data and configured in the decoder.
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
       
//        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//        
//        return loaded
        
        // Attempt to decode the data into the specified type
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSOn.")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
      //  It's not a big change, but it means the method will now tell you what went wrong with decoding,
     //  it's great for times when your Swift code and JSON file don't quite match up!
    }
}
