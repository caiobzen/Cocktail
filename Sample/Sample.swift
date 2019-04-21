import AppKit
import Cocktail

class SampleViewController: NSViewController {

    @IBOutlet weak var drinks: NSTextField!
    @IBOutlet weak var drinkNameTextField: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinks.stringValue = ""
        drinkNameTextField.placeholderString = "Type a cocktail name"
    }
    
    @IBAction func search(_ sender: Any) {
        CocktailAPI(with: Fetcher()).searchBy(drinkName: drinkNameTextField.stringValue) { [weak self] response in
            print("response: \(response)")
            DispatchQueue.main.async {
                switch response {
                case .success(let res):
                    self?.drinks.stringValue = res.cocktails.map { $0.name }.joined(separator: ", ")
                case .failure(let err):
                    print("Error \(err)")
                }
            }
        }
    }
}
