class CocktailAPI {
    let fetcher: Fetcher?
    
    init(with fetcher: Fetcher? = nil) {
        self.fetcher = fetcher
    }
    
    func search(byName: String, completion: @escaping (CocktailResponse) -> Void) {
        
    }
}

struct Cocktail: Codable {
    let strDrink: String
}


struct CocktailResponse: Codable {
    let cocktails: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
}
