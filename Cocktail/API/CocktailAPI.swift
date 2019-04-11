public class CocktailAPI {
    let fetcher: Fetcher?
    
    public init(with fetcher: Fetcher? = nil) {
        self.fetcher = fetcher
    }
    
    public func searchBy(drinkName: String, completion: @escaping (CocktailResponse) -> Void) {
        let endpoint = Endpoint(path: "search.php?s=", param: drinkName)
        fetcher?.fetch(endpoint) { response in
            if let response = response,
                let decodedObject = try? JSONDecoder().decode(CocktailResponse.self, from: response) {
                completion(decodedObject)
            }
        }
    }
}
