import UIKit

struct ViewControllerPresenterBuilder {
    static func build(view: ViewController) -> ViewControllerPresenter {
        let dataStore = ViewControllerDataStore()
        let repository = ViewControllerRepository(dataStore: dataStore)
        let useCase = ViewControllerUseCase(useCaseInput: repository)
        let wireframe = ViewControllerWireframe(view: view)
        let presenter = ViewControllerPresenter(view: view, wireframe: wireframe, useCase: useCase)

        return presenter
    }
}
