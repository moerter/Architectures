import XCTest
@testable import CleanCode

// MARK: - Spy

class ListInteractorPresentationLogicSpy: ListPresentationLogic {
  var presentPersonsCalled = false
  
  func presentPersons(response: List.Persons.Response) {
    presentPersonsCalled = true
  }
}

class PersonWorkerListSpy: PersonWorker {
  var loadPersonsCalled = false
  
  override func loadPersons() -> [Person] {
    loadPersonsCalled = true
    
    return []
  }
}

// MARK: - XCTestCase

class ListInteractorSpec: XCTestCase {
  let interactor = ListInteractor()
  let spy = ListInteractorPresentationLogicSpy()
  let workerSpy = PersonWorkerListSpy()
  
  override func setUp() {
    interactor.presenter = spy
    interactor.worker = workerSpy
  }
  
  func testPresenterConnection() {
    let request = List.Persons.Request()
    interactor.loadPersons(request: request)

    XCTAssertTrue(spy.presentPersonsCalled, "Presenter has not been called")
  }
  
  func testWorkerConnection() {
    let request = List.Persons.Request()
    interactor.loadPersons(request: request)
    
    XCTAssertTrue(workerSpy.loadPersonsCalled, "Worker has not been called")
  }
}
