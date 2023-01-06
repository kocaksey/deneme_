//
//  TableViewController.swift
//  _hw_02_seyhunkocak_
//
//  Created by Seyhun Koçak on 5.01.2023.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var currencies: [Currency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "CurrencyCell", bundle: nil), forCellReuseIdentifier: "CurrencyCellIdentifier")
        
        fetchData()

    }
   
    
    
    private func fetchData() {
        
        
        if let url = URL(string: "https://api.coingecko.com/api/v3/coins/list") {
            var request: URLRequest = .init(url: url)
            
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request as URLRequest) { data, respone, error in
                if error != nil {
                    return
                }
             
                
                if let data = data {
                    
                    do {
                        let currencies = try JSONDecoder().decode([Currency].self, from: data)
                       

                        self.currencies = currencies
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                        
                    } catch {
                        print("Decoding error")
                    }

                }
                
            }
            
            task.resume()
            
        }
        

    }

}

extension TableViewController : UITableViewDelegate {
    
}
extension TableViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCellIdentifier", for: indexPath) as! CurrencyCell
        
        cell.codeLabel.text = currencies[indexPath.row].name
        cell.rateLabel.text = currencies[indexPath.row].id
    
        return cell
    }
    
}
