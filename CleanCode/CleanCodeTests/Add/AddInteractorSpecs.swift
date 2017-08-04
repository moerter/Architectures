import XCTest
@testable import CleanCode

// MARK: - Spy

class AddInteractorPresentationLogicSpy: AddPresentationLogic {
  var presentList = false
  
  func presentList(response: Add.Person.Response) {
    presentList = true
  }
}

class PersonWorkerDetailSpy: PersonWorker {
  var saveNewPersonCalled = false
  
  override func saveNewPerson(person: Person) {
    saveNewPersonCalled = true
  }
}

// MARK: - XCTestCase

class AddInteractorSpec: XCTestCase {
  let interactor = AddInteractor()
  let spy = AddInteractorPresentationLogicSpy()
  let workerSpy = PersonWorkerDetailSpy()

  override func setUp() {
    interactor.presenter = spy
    interactor.worker = workerSpy
  }
  
  func testPresenterConnection() {
    let request = Add.Person.Request(firstName: "firstName", lastName: "lastName")
    interactor.savePerson(request: request)
    
    XCTAssertTrue(spy.presentList, "Presenter has not been called")
  }
  
  func testWorkerConnection() {
    let request = Add.Person.Request(firstName: "firstName", lastName: "lastName")
    interactor.savePerson(request: request)
    
    XCTAssertTrue(workerSpy.saveNewPersonCalled, "Worker has not been called")
  }
}
