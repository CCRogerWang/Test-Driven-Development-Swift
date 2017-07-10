//
//  StoryboardTests.swift
//  ToDo
//
//  Created by roger on 2017/7/10.
//  Copyright © 2017年 roger. All rights reserved.
//
@testable import ToDo

import XCTest

class StoryboardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_InitialViewController_IsItemListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController =
            storyboard.instantiateInitialViewController()
                as! UINavigationController
        let rootViewController = navigationController.viewControllers[0]
        XCTAssertTrue(rootViewController is ItemListViewController)
    }
}
