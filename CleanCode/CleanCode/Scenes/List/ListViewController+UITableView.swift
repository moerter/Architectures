import UIKit

extension ListViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return persons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCell") as? BasicTableViewCell else {
      return UITableViewCell()
    }
    
    let person = persons[indexPath.row]
    cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
    
    cell.accessoryType = .disclosureIndicator
    
    return cell
  }
}

extension ListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailVC = DetailViewController()
    router?.routeToDetailScene(source: self, destination: detailVC)
  }
}
