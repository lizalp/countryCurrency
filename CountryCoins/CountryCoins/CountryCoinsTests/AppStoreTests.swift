//
//  AppStoreTests.swift
//  CountryCoinsTests
//
//  Created by Liz Alpizar on 12/06/24.
//
@testable import CountryCoins
import XCTest

final class AppStoreTests: XCTestCase {
    func testFlagDataIsLoaded() {
        let sui = AppStorage()
        //objeto vacio
        XCTAssertTrue(sui.flags.isEmpty)
        //funcion de carga
        sui.fetchFlags()
        //carga de info correcta
        XCTAssertFalse(sui.flags.isEmpty)
    }

}
