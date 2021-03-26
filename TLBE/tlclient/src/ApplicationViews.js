import React from "react"
import { Route } from "react-router-dom"
import { TuneForm } from "./components/tunes/TuneForm"
import { TuneProvider } from "./providers/TuneProvider"
import { Home } from "./Home"
import { ListCard } from "./components/tunes/ListCard"
import { TunesList } from "./components/tunes/TuneCollectionList"
// import { CollectionProvider } from "./components/collections/CollectionsProvider"
import { UserProfileProvider } from "./providers/UserProfileProvider"
import { UserList } from "./components/user/UserList"
import { TuningProvider } from "./providers/TuningsProvider"
import { PhotoProvider } from "./providers/PhotoProvider"
// import { OptionsList } from "./components/options/OptionsList"

export const ApplicationViews = (props) => {
    return (
        <>
            {/* <CollectionProvider> */}
            <TuneProvider>
                <UserProfileProvider>
                    <TuningProvider>
                        <PhotoProvider>

                            <Route exact path="/">
                                <Home />
                            </Route>

                            <Route exact path="/tunes/create">
                                <TuneForm />
                            </Route>

                            <Route exact path="/tunes/edit/:tuneId">
                                <TuneForm />
                            </Route>

                            <Route exact path="/tunes">
                                <TunesList />
                            </Route>

                            <Route exact path="/users">
                                <UserList />
                            </Route>

                            {/* <Route exact path="/tunes/options">
                                <OptionsList />
                            </Route> */}

                        </PhotoProvider>
                    </TuningProvider>
                </UserProfileProvider>
            </TuneProvider>
            {/* </CollectionProvider> */}
        </>
    )
}
