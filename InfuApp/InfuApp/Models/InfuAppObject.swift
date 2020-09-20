// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let infuAppData = try? newJSONDecoder().decode(InfuAppData.self, from: jsonData)

import Foundation

// MARK: - InfuAppData
struct InfuAppData: Codable {
    let infussions: [Infussion]
    let infuFamily: [InfuFamily]
}

// MARK: - Catalogue
struct InfuFamily: Codable {
    let id: Int
    let longTitle: String
    let title: String
    let image: String
    let symbol: String
}

// MARK: - Infussion
struct Infussion: Codable {
    let id: Int
    let title: String
    let generalInfo: String
    let properties: String
    let image: String
    let icon: String
    let infuFamilyID: Int
    let tags: Tags

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case generalInfo
        case properties
        case image
        case icon
        case infuFamilyID = "infuFamilyID"
        case tags
    }
}

// MARK: - Tags
struct Tags: Codable {
    let time: String
    let temp: String
}

