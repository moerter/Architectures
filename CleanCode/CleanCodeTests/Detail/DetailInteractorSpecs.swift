import XCTest
@testable import CleanCode

// MARK: - Spy

class DetailInteractorPresentationLogicSpy: DetailPresentationLogic {
  var presentPersonCalled = false
  
  func presentPerson(response: Detail.GetPerson.Response) {
    presentPersonCalled = true
  }
}

// MARK: - XCTestCase

class DetailInteractorSpec: XCTestCase {
  let interactor = DetailInteractor()
  let spy = DetailInteractorPresentationLogicSpy()
  
  override func setUp() {
    interactor.presenter = spy
    
    let person = Person(firstName: "firstName", lastName: "lastName")
    interactor.person = person
  }
  
  func testPresenterConnection() {
    let request = Detail.GetPerson.Request()
    interactor.getPerson(request: request)
    XCTAssertTrue(spy.presentPersonCalled, "Presenter has not been called")
  }
}
