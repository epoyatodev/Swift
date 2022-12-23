//
//  TransformationsTest.swift
//  ProyectoDosTests
//
//  Created by Enrique Poyato Ortiz on 22/12/22.
//

import XCTest

final class TransformationsTest: XCTestCase {

    var transformation: Tranformation!

    override func setUp()  {
        super.setUp()
        
        transformation = Tranformation(id: "22", name: "Super Saiyan", photo: "https://www.keepcoding.io", description: "This is the real one!!")
    }

    override func tearDown()  {
        transformation = nil
        super.tearDown()
    }

 
    func testTranformationId() {
        XCTAssertNotNil(transformation.id)
        XCTAssertEqual(transformation.id, "22")
        XCTAssertNotEqual(transformation.id, "7")
    }
    
    func testTranformationName() {
        XCTAssertNotNil(transformation.name)
        XCTAssertEqual(transformation.name, "Super Saiyan")
        XCTAssertNotEqual(transformation.name, "Super Saiyan Blue")
    }
    func testTranformationPhoto() {
        
        let url = URL(string: transformation.photo)
        XCTAssertNotNil(transformation.photo)
//        XCTAssertEqual(heroe.photo, "https://www.keepcoding.io")
//        XCTAssertNotEqual(heroe.photo, "https://www.keepcoding.com")
        
        XCTAssertNotNil(url?.absoluteURL)
    }
    
    func testTranformationDescription() {
        XCTAssertNotNil(transformation.description)
        XCTAssertEqual(transformation.description, "This is the real one!!")
        XCTAssertNotEqual(transformation.description, "Goku alwaySS win!!")
    }
    
   
    
    
    



}
