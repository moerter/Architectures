import XCTest
@testable import CleanCode

// MARK: - Spy

class AddBusinessLogicSpy: AddBusinessLogic {
  var savePersonCalled = false
  
  func savePerson(request: Add.Person.Request) {
    savePersonCalled = true
  }
}

// MARK: - XCTestCase

class AddViewControllerSpec: XCTestCase {
  let viewController = AddViewController()
  let spy = AddBusinessLogicSpy()
  
  override func setUp() {
    viewController.interactor = spy
  }
  
  func testInteractorConnection() {
    viewController.savePerson()

    XCTAssertTrue(spy.savePersonCalled, "Interactor has not been called")
  }
}
