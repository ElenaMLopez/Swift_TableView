import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let countries = ["Spain","Mexico", "UK", "Germany", "Canada", "Australia", "France"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
//        tableView.tableFooterView = UIView() // The table footer is an empty view. Eliminates extra cells.
                
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Simple cells"
        }
        return "Dinamic cells"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "End of section"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
           return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
                cell?.backgroundColor = .systemGray3
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
            }
            print(indexPath.row)
            cell!.textLabel?.text = countries[indexPath.row]
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
            
            cell!.titleLabel.text = String(indexPath.row + 1)
            cell!.subTitleLabel.text = countries[indexPath.row]
            
            if indexPath.row == 2 {
                
                cell!.subTitleLabel.text = "lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem"
            }
            return cell!
        }
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(countries[indexPath.row])
    }
}

