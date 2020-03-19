protocol AddressRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct AddressRepository {
    let repositoryInput: AddressRepositoryInput
}

extension AddressRepository: AddressUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
