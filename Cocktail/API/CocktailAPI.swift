class CocktailAPI {
    let fetcher: Fetcher?
    
    init(with fetcher: Fetcher? = nil) {
        self.fetcher = fetcher
    }
    
    func search(byName: String, completion: @escaping (CocktailResponse) -> Void) {
        let endpoint = Endpoint(path: "", param: "")
        fetcher?.fetch(endpoint) { response in
            if let response = try? JSONDecoder().decode(CocktailResponse.self, from: response) {
                completion(response)
            }
        }
    }
}
