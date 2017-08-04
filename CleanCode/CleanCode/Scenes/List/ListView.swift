import UIKit

// MARK: - Implementation

internal class ListView: UIView {
  
  var tableView: UITableView
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    
    tableView = UITableView(frame: .zero, style: .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    super.init(frame: frame)
    
    self.addSubview(tableView)
    
    backgroundColor = .white
    createConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func createConstraints() {
    tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
  }
}
