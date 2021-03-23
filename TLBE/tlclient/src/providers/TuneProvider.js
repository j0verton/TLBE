import React, { useState, createContext, useContext } from "react"
// import { CollectionContext } from "../collections/CollectionsProvider"

export const TuneContext = createContext()

export const TuneProvider = props => {
    const { getToken } = useContext(UserProfileContext);

    const [tunes, setTunes] = useState([])
    const [tune, setTune] = useState({})
    const { getCollectionsByUserId, saveCollection, deleteUnusedCollections } = useContext(CollectionContext)

    //need a getTunes for the TOD

    const getTunesInCollectionForCurrentUser = () => {
        return getToken()
            .then(token =>
                fetch(`/api/collections`, {
                    method: "GET",
                    headers: {
                        Authorization: `Bearer ${token}`,
                    },
                })
                    .then(response => response.json())
            )
    }

    const addTune = tuneObj => {
        return getToken().then((token) =>
            fetch("/api/tune", {
                method: "POST",
                headers: {
                    Authorization: `Bearer ${token}`,
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(tuneObj),
            }).then((resp) => resp.json())
        );
    };

    // allows user to edit their Tunes
    const editTune = tuneObj => {
        return getToken().then((token) =>
            fetch("/api/tune", {
                method: "POST",
                headers: {
                    Authorization: `Bearer ${token}`,
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(tuneObj)
            })
        )
    }


    getTuneByIdWithTC(tuneObj.id).then(res => {
        if (res.tuning === tuneObj.tuning && res.key === tuneObj.key) {
            return fetch(`http://localhost:8088/tunes/${tuneObj.id}`, {
                method: 'PUT',
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(tuneObj)
            })
        } else {
            deleteTune(res.id)
                .then(() => {
                    delete tuneObj.id
                    saveTune(tuneObj)
                })
        }
    })
}

const addStarToTune = (tuneId) => {
    return getToken().then((token) => {
        fetch(`api/star/${tuneId}`, {
            method: 'PATCH',
            headers: {
                "Content-Type": "application/json"
            }
        })
    })
}

const addAudioToTune = (id, url) => {
    return fetch(`http://localhost:8088/tunes/${id}`, {
        method: 'PATCH',
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            audioUpload: url
        })
    })
}

const removeStarFromTune = (tuneId) => {
    return fetch(`http://localhost:8088/tunes/${tuneId}`, {
        method: 'PATCH',
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            starred: 0
        })
    })
}
// removes Tune from database
const deleteTune = tuneId => {
    return fetch(`http://localhost:8088/tunes/${tuneId}`, {
        method: 'DELETE'
    })
        .then(deleteUnusedCollections)
}

const deleteTuneCollections = tuneCollectionsId => {
    return fetch(`http://localhost:8088/tuneCollections/${tuneCollectionsId}`, {
        method: 'DELETE'
    })
}

const getTuneByIdWithTC = id => {
    return fetch(`http://localhost:8088/tunes/${id}?_embed=tuneCollections`)
        .then(res => res.json())
}

const getTuneById = id => {
    return fetch(`http://localhost:8088/tunes/${id}`)
        .then(res => res.json())
}

const getTunesByUserId = (userId) => {
    return fetch(`http://localhost:8088/tunes/?userId=${userId}`)
        .then(res => res.json())
    // .then(setTunes)
}

const getStarredTunesByUserId = (userId) => {
    return fetch(`http://localhost:8088/tunes/?userId=${userId}&starred=1`)
        .then(res => res.json())
    // .then(setTunes)
}

return (
    <TuneContext.Provider value={{
        tune, tunes, getTunes, saveTune, editTune, deleteTune, getTuneById, getTunesByUserId, getStarredTunesByUserId, addStarToTune, removeStarFromTune, addAudioToTune, addTuneCollections
    }}>
        {props.children}
    </TuneContext.Provider>
)
}
