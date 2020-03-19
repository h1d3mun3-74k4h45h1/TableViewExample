protocol CustomerRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct CustomerRepository {
    let repositoryInput: CustomerRepositoryInput
}

extension CustomerRepository: CustomerUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
