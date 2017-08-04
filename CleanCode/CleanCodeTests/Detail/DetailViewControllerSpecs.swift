import XCTest
@testable import CleanCode

// MARK: - Spy

class DetailBusinessLogicSpy: DetailBusinessLogic {
  var getPersonCalled = false
  
  func getPerson(request: Detail.GetPerson.Request) {
    getPersonCalled = true
  }
}

// MARK: - XCTestCase

class DetailViewControllerSpec: XCTestCase {
  let viewController = DetailViewController()
  let spy = DetailBusinessLogicSpy()
  
  override func setUp() {
    viewController.interactor = spy
  }
  
  func testInteractorConnection() {
    viewController.getPerson()
    
    XCTAssertTrue(spy.getPersonCalled, "Interactor has not been called")
  }
}
