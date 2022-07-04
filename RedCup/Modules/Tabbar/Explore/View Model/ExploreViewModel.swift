//
//  ExploreViewModel.swift
//  RedCup
//
//  Created by Chirp Technologies on 04/07/2022.
//

import Foundation

class ExploreViewModel {
    var filters = [
        FilterItem(title: "My Location", type: .location),
        FilterItem(title: "Distance", type: .distance),
        FilterItem(title: "Event Type", type: .eventType),
        FilterItem(title: "Sort", type: .sort)
    ]
    
    var headersList = ["Trending", "Who to follow", "This weekend"]

}
