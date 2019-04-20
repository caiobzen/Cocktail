@testable import Cocktail

class CocktailAPIMock: CocktailAPI {
    
    var _fetcher: Fetcher? {
        return fetcher
    }
    
    override func searchBy(drinkName: String, completion: @escaping (Result<CocktailResponse, Error>) -> Void) {
        super.searchBy(drinkName: drinkName, completion: completion)
        let testBundle = Bundle(for: type(of: self))
        let jsonUrl = testBundle.url(forResource: "margherita", withExtension: "json")!
        let data = try! Data(contentsOf: jsonUrl)
        let cocktails = try! JSONDecoder().decode(CocktailResponse.self, from: data)
        completion(.success(cocktails))
    }
}
