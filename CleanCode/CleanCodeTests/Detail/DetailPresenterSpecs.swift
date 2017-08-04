import XCTest
@testable import CleanCode

// MARK: - Spy

class DetailDisplayLogicSpy: DetailDisplayLogic {
  var displayPersonCalled = false
  
  func displayPerson(viewModel: Detail.GetPerson.ViewModel) {
    displayPersonCalled = true
  }
}

// MARK: - XCTestCase

class DetailPresenterSpec: XCTestCase {
  let presenter = DetailPresenter()
  let spy = DetailDisplayLogicSpy()
  
  override func setUp() {
    presenter.viewController = spy
  }
  
  func testViewControllerConnection() {
    let person = Person(firstName: "firstName", lastName: "lastName")
    let response = Detail.GetPerson.Response(person: person)
    presenter.presentPerson(response: response)
    
    XCTAssertTrue(spy.displayPersonCalled, "ViewController has not been called")
  }
}
