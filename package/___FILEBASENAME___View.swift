import ComposableArchitecture
import SwiftUI

package struct ___VARIABLE_MODULENAME___View: View {
    package struct State: Equatable {
        package init(state: ___VARIABLE_MODULENAME___.State) {}
    }

    let store: StoreOf<___VARIABLE_MODULENAME___>

    package var body: some View {
        WithViewStore(store, observe: ___VARIABLE_MODULENAME___View.State.init) { viewStore in
            Text("Hello world!")
        }
    }
}

#Preview("___VARIABLE_MODULENAME___View") {
    ___VARIABLE_MODULENAME___View(
        store: .init(
            initialState: ___VARIABLE_MODULENAME___.State()
        ) {
            ___VARIABLE_MODULENAME___()
        }
    ).previewLayout(.sizeThatFits)
}

