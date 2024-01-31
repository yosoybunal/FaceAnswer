//
//  Categories.swift
//  FaceAnswer
//
//  Created by Berkay Unal on 30.01.2024.
//

import Foundation

enum Categories {

  case EuropeanCinema(EuropeanCinemaData)
  case GalatasarayLegends(GalatasarayLegendsData)

  var sectionName: String {
    switch self {
    case .EuropeanCinema(_):
      return "European Cinema"
    case .GalatasarayLegends(_):
      return "Galatasaray Legends"
    }
  }
}
