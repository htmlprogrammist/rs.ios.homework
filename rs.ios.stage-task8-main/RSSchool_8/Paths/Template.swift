//
//  Template.swift
//
//  Project: RSSchool_T8
// 
//  Author:  Uladzislau Volchyk
//  On:      11.07.2021
//

import UIKit

protocol PathTemplate {
    var path_1: CGPath { get }
    var path_2: CGPath { get }
    var path_3: CGPath { get }
}

final class PathMaster {
    static let shared = PathMaster()
    var template: PathTemplate = HeadPath()
}
