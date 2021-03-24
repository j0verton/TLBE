import React, { useContext, useEffect, useState } from "react"
import "./Tune.css"
import { Tab } from "semantic-ui-react"
// import { CollectionContext } from "../../providers/CollectionsProvider"
import { TuneContext } from "../../providers/TuneProvider"
import { ListCard } from "./ListCard"

export const TunesList = (props) => {
    const { getTunesByUserId, getTunesInCollectionForCurrentUser } = useContext(TuneContext)
    // const { collections, getCollectionsByUserId } = useContext(CollectionContext)
    const [tunes, setTunes] = useState([])
    const [userCollections, setUserCollections] = useState([])
    const [changes, setChanges] = useState([])
    const [panes, setPanes] = useState([])
    const [activeIndex, setActiveIndex] = useState()

    const handleChange = (event, data) => {
        data ? localStorage.setItem("active_index", data.activeIndex) : localStorage.setItem("active_index", 0)
        setChanges(changes + 1)
    }

    useEffect(() => {
        getTunesInCollectionForCurrentUser().then(setUserCollections).then(() => {
            if (userCollections) {
                let paneObjects = userCollections.map(collection => {
                    return { menuItem: collection.name, render: () => <Tab.Pane>{<ListCard key={collection.id} parentCallback={handleChange} collectionId={collection.id} tunesArr={collection.tuneCollections} />}</Tab.Pane> }
                })
                setPanes(paneObjects)
            }
        })
    }, [userCollections, tunes, changes])

    return panes.length ? (
        <Tab renderActiveOnly id="ListTabs" activeIndex={localStorage.getItem("active_index")} onTabChange={handleChange} panes={panes} />
    ) : <h3 className="emptyTunes">No Tunes Added Yet!</h3>
}