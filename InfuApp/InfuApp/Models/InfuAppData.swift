// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let infuAppData = try? newJSONDecoder().decode(InfuAppData.self, from: jsonData)

import Foundation

// MARK: - InfuAppData
struct InfuAppData: Codable {
    let infussions: [Infussion]
    let catalogue: [Catalogue]
}

// MARK: - Catalogue
struct Catalogue: Codable {
    let id: Int
    let longTitle, title, image, symbol: String
}

// MARK: - Infussion
struct Infussion: Codable {
    let title, generalInfo, properties, image: String
    let icon: String
    let catalogueID: Int
    let tags: Tags

    enum CodingKeys: String, CodingKey {
        case title, generalInfo, properties, image, icon
        case catalogueID = "catalogueId"
        case tags
    }
}

// MARK: - Tags
struct Tags: Codable {
    let time, temp: String
}

