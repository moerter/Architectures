import XCTest
@testable import CleanCode

// MARK: - Spy

class ListBusinessLogicSpy: ListBusinessLogic {
  var loadPersonsCalled = false
  
  func loadPersons(request: List.Persons.Request) {
    loadPersonsCalled = true
  }
}

class TableViewSpy: UITableView {
  var reloadDataCalled = false
  
  override func reloadData() {
    reloadDataCalled = true
  }
}

// MARK: - XCTestCase

class ListViewControllerSpec: XCTestCase {
  let viewController = ListViewController()
  let spy = ListBusinessLogicSpy()
  let tableViewSpy = TableViewSpy()
  
  override func setUp() {
    
    tableViewSpy.register(BasicTableViewCell.self, forCellReuseIdentifier: "BasicTableViewCell")
    
    viewController.interactor = spy
    viewController.mainView?.tableView = tableViewSpy
  }
  
  func testInteractorConnection() {
    viewController.loadPersons()
    
    XCTAssertTrue(spy.loadPersonsCalled, "Interactor has not been called")
  }
  
  func testDisplayPersons() {
    let viewModel = List.Persons.ViewModel(displayPersons: [])
    viewController.displayPersons(viewModel: viewModel)
    
    XCTAssertTrue(tableViewSpy.reloadDataCalled, "TableView should reload data")
  }
  
  func testNumberOfSections() {
    let numberOfSections = viewController.numberOfSections(in: (viewController.mainView?.tableView)!)
    
    XCTAssertEqual(numberOfSections, 1, "There should be one section")
  }
  
  func testNumberOfRows() {
    let personOne = List.Persons.ViewModel.DisplayPerson(firstName: "Person", lastName: "One")
    let personTwo = List.Persons.ViewModel.DisplayPerson(firstName: "Person", lastName: "Two")
    let personThree = List.Persons.ViewModel.DisplayPerson(firstName: "Person", lastName: "Three")
    
    let displayPersons = [personOne, personTwo, personThree]
    viewController.persons = displayPersons
    
    let numberOfRows = viewController.tableView((viewController.mainView?.tableView)!, numberOfRowsInSection: 0)

    XCTAssertEqual(numberOfRows, displayPersons.count, "The number of table view rows should equal the number of persons to display")

  }
  
  func testCell() {
    let personOne = List.Persons.ViewModel.DisplayPerson(firstName: "Person", lastName: "One")
    let personTwo = List.Persons.ViewModel.DisplayPerson(firstName: "Person", lastName: "Two")
    let personThree = List.Persons.ViewModel.DisplayPerson(firstName: "Person", lastName: "Three")
    
    let displayPersons = [personOne, personTwo, personThree]
    viewController.persons = displayPersons
    
    let indexPath = IndexPath(row: 0, section: 0)
    guard let cell = viewController.tableView((viewController.mainView?.tableView)!, cellForRowAt: indexPath) as? BasicTableViewCell else {
      XCTFail("Cell must be of type BasicTableViewCell")
      return
    }
    
    XCTAssertEqual(cell.textLabel?.text, "Person One", "Cell is not displaying the right person")

  }
}
