public class CocktailAPI {
    let fetcher: Fetcher?
    
    public init(with fetcher: Fetcher? = nil) {
        self.fetcher = fetcher
    }
    
    public func searchBy(drinkName: String, completion: @escaping (Result<CocktailResponse, Error>) -> Void) {
        let endpoint = Endpoint(path: "search.php?s=", param: drinkName)
        fetcher?.fetch(endpoint) { response in
            switch response {
            case .success(let data):
                if let drinksResponse = try? JSONDecoder().decode(CocktailResponse.self, from: data) {
                    completion(.success(drinksResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
