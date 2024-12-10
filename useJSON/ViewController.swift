import UIKit

class ViewController: UIViewController {
    private struct DataSource {
        let author: String
        let quote: String
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    private let dataSource: [DataSource] = [
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата"),
        DataSource(author: "Автор", quote: "Цитата")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor
        ).isActive = true
        tableView.trailingAnchor.constraint(
            equalTo: view.trailingAnchor
        ).isActive = true
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
        ).isActive = true
        tableView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
        ).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 140 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }
        cell.configCell(
            authorName: dataSource[indexPath.row].author,
            quoteName: dataSource[indexPath.row].quote
        )
        
        return cell
    }
}
