//
//  FilterModel.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import Foundation

struct FilterItem {
    var title: String?
    var type: FilterType?
}

enum FilterType: String {
    case location, distance, eventType, sort
}
