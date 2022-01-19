//
//  EndpointType.swift
//  Movie Application
//
//  Created by oluwayemisi oguntayo on 18/01/2022.
//

import Foundation

protocol EndpointType {

    var baseURL: URL { get }

    var path: String { get }

}
