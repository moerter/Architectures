import XCTest
@testable import CleanCode

// MARK: - Spy

class ListDisplayLogicSpy: ListDisplayLogic {
  var displayPersonsCalled = false
  
  func displayPersons(viewModel: List.Persons.ViewModel) {
    displayPersonsCalled = true
  }
}

// MARK: - XCTestCase

class ListPresenterSpec: XCTestCase {
  let presenter = ListPresenter()
  let spy = ListDisplayLogicSpy()
  
  override func setUp() {
    presenter.viewController = spy
  }
  
  func testViewControllerConnection() {
    let response = List.Persons.Response(persons: [])
    presenter.presentPersons(response: response)
    
    XCTAssertTrue(spy.displayPersonsCalled, "ViewController has not been called")
  }
}
