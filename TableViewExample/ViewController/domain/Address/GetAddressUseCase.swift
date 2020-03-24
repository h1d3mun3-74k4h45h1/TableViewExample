protocol GetAddressUseCaseInput {
    func execute() -> [String]
}

struct GetAddressUseCase {
    let useCaseInput: GetAddressUseCaseInput
}

extension GetAddressUseCase: GetUseCaseProtocol {
    func execute() -> [String] {
        return useCaseInput.execute()
    }
}
