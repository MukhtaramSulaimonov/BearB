//
//  Activity.swift
//  BearB
//
//  Created by Mukhtaram Sulaimonov on 12/12/24.
//

import SwiftUI

struct Item {
    let id = UUID()
    let imageName: String
    let title: String
    let category: Category
    let price: String
    let description: String
}

enum Category: String {
    case mural
    case creator
    case artistCollaboration
    case brandCollaboration
    case culturalIcons
    case countryCitySpecific
    case movieTVComic
    case musicRelated
    case sportsCollaboration
    case techInnovationThemes
    case luxuryMaterialVersions
    case seasonalEventBased 
}
