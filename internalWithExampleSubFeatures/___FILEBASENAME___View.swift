import ComposableArchitecture
import SwiftUI

struct ___VARIABLE_MODULENAME___View: View {
    struct ViewState: Equatable {
        init(store: BindingViewStore<___VARIABLE_MODULENAME___.State>) {
            self._binding = store.$binding
            self.isLoading = store.isLoading
        }
        var isLoading: Bool
        @BindingViewState var binding: String
    }

    let store: StoreOf<___VARIABLE_MODULENAME___>

    var body: some View {
        WithViewStore(store, observe: ViewState.init(store:)) { viewStore in
            VStack {
                Text("Hello world!")
                PersistentSubFeatureView(
                    store: store
                        .scope(
                            state: \.persistentSubFeatureState,
                            action: TestFeature.Action.persistentSubFeatureAction
                        )
                )
            }.onAppear {
                    viewStore.send(.startLoading)
                }
        }
        .sheet(store: store.scope(
                state: \.$presentedFeatureState,
                action: ___VARIABLE_MODULENAME___.Action.presentedFeatureAction
            )) { store in
                PresentedFeatureView(store: store)
            }
    }
}

// MARK: - Example child views

struct PresentedFeatureView: View {
    let store: StoreOf<PresentedFeature>
    var body: some View {
        Button {
            store.send(.didFinish)
        } label: {
            Text("Tell my parent to close me.")
        }
    }
}

struct PersistentSubFeatureView: View {
    let store: StoreOf<PersistentSubFeature>
    var body: some View {
        Text("persistent sub-feature")
    }
}

// MARK: - Previews

#Preview("___VARIABLE_MODULENAME___View") {
    ___VARIABLE_MODULENAME___View(
        store: .init(
            initialState: ___VARIABLE_MODULENAME___.State()
        ) {
            ___VARIABLE_MODULENAME___()
        }
    ).previewLayout(.sizeThatFits)
}

