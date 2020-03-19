protocol ItemRepositoryInput {
    func itemCount() -> Int
    func itemData(of index: Int) -> String?
}

struct ItemRepository {
    let repositoryInput: ItemRepositoryInput
}

extension ItemRepository: ItemUseCaseInput {
    func itemCount() -> Int {
        return repositoryInput.itemCount()
    }

    func itemData(of index: Int) -> String? {
        return repositoryInput.itemData(of: index)
    }
}
