import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fetchZenQuote(_ sender: UIButton) {
        if let url = URL(string: "https://zenquotes.io/api/random") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let quoteData = try JSONDecoder().decode([ZenQuote].self, from: data)
                        if let randomQuote = quoteData.first {
                            // Use randomQuote.text to display the Zen quote
                            print(randomQuote.text)
                        }
                    } catch {
                        print("Error decoding Zen quote data: \(error)")
                    }
                } else if let error = error {
                    print("Error fetching Zen quote: \(error)")
                }
            }.resume()
        }
    }
    
    @IBAction func fetchRonSwansonQuote(_ sender: UIButton) {
        if let url = URL(string: "https://ron-swanson-quotes.herokuapp.com/v2/quotes") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let quotes = try JSONDecoder().decode([String].self, from: data)
                        if let quote = quotes.first {
                            // Use quote to display the Ron Swanson quote
                            print(quote)
                        }
                    } catch {
                        print("Error decoding Ron Swanson quote data: \(error)")
                    }
                } else if let error = error {
                    print("Error fetching Ron Swanson quote: \(error)")
                }
            }.resume()
        }
    }
    
    @IBAction func fetchGameOfThronesQuote(_ sender: UIButton) {
        if let url = URL(string: "https://api.gameofthronesquotes.xyz/v1/random") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("\(jsonString)")
                    } else {
                        print("Error converting data to string.")
                    }
                } else if let error = error {
                    print("Error fetching Game of Thrones quote: \(error)")
                }
            }.resume()
        }
    }
}
