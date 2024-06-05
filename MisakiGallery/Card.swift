//
//  Card.swift
//  MisakiGallery
//
//  Created by Spike Liao on 2021/12/17.
//


import Foundation

extension Card: Identifiable {
    var id: String { resourceID }
}

// MARK: - Card
struct Card: Codable {
    let cid: Int
    let name: String
    let sortID, idolID, idolType: Int
    let resourceID: String
    let rarity: Int
    let category: Int
    let extraType: Int?
    let costume, bonusCostume: Costume?
    let flavorText, flavorTextAwakened, awakeningText: String?
    let levelMax, levelMaxAwakened, vocalMin, vocalMax: Int?
    let vocalMinAwakened, vocalMaxAwakened, vocalMasterBonus, danceMin: Int?
    let danceMax, danceMinAwakened, danceMaxAwakened, danceMasterBonus: Int?
    let visualMin, visualMax, visualMinAwakened, visualMaxAwakened: Int?
    let visualMasterBonus, life, masterRankMax: Int?
    let centerEffect: CenterEffect?
    let centerEffectName: String?
    let skill: [Skill]?
    let skillLevelMax: Int?
    let skillName: String?
    let addDate: String?

    enum CodingKeys: String, CodingKey {
        case cid = "id"
        case name
        case sortID = "sortId"
        case idolID = "idolId"
        case idolType
        case resourceID = "resourceId"
        case rarity, category, extraType, costume, bonusCostume, flavorText, flavorTextAwakened, awakeningText, levelMax, levelMaxAwakened, vocalMin, vocalMax, vocalMinAwakened, vocalMaxAwakened, vocalMasterBonus, danceMin, danceMax, danceMinAwakened, danceMaxAwakened, danceMasterBonus, visualMin, visualMax, visualMinAwakened, visualMaxAwakened, visualMasterBonus, life, masterRankMax, centerEffect, centerEffectName, skill, skillLevelMax, skillName, addDate
    }
}

// MARK: - Costume
struct Costume: Codable {
    let id: Int
    let name, costumeDescription, resourceID, modelID: String
    let sortID: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case costumeDescription = "description"
        case resourceID = "resourceId"
        case modelID = "modelId"
        case sortID = "sortId"
    }
}

// MARK: - CenterEffect
struct CenterEffect: Codable {
    let id: Int
    let centerEffectDescription: String
    let idolType, attribute, value: Int

    enum CodingKeys: String, CodingKey {
        case id
        case centerEffectDescription = "description"
        case idolType, attribute, value
    }
}

// MARK: - Skill
struct Skill: Codable {
    let id: Int
    let skillDescription: String
    let effectID, evaluation, evaluation2, duration: Int
    let interval, probability: Int
    let value: [Int]

    enum CodingKeys: String, CodingKey {
        case id
        case skillDescription = "description"
        case effectID = "effectId"
        case evaluation, evaluation2, duration, interval, probability, value
    }
}
