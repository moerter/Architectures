import XCTest
@testable import CleanCode

// MARK: - Spy

class AddDisplayLogicSpy: AddDisplayLogic {
  var displayListCalled = false
  
  func displayList(viewModel: Add.Person.ViewModel) {
    displayListCalled = true
  }
}

// MARK: - XCTestCase

class AddPresenterSpec: XCTestCase {
  let presenter = AddPresenter()
  let spy = AddDisplayLogicSpy()
  
  override func setUp() {
    presenter.viewController = spy
  }
  
  func testViewControllerConnection() {
    let response = Add.Person.Response()
    presenter.presentList(response: response)
    
    XCTAssertTrue(spy.displayListCalled, "ViewController has not been called")
  }
}
