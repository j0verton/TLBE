import React, { useState, createContext, useContext } from "react"
// import { CollectionContext } from "../providers/CollectionsProvider"
import { UserProfileContext } from "./UserProfileProvider"
export const TuneContext = createContext()

export const TuneProvider = props => {
    const { getToken } = useContext(UserProfileContext);

    const [tunes, setTunes] = useState([])
    const [tune, setTune] = useState({})
    // const { getCollectionsByUserId, saveCollection, deleteUnusedCollections } = useContext(CollectionContext)

    //need a getTunes for the TOD

    const getTunesInCollectionForCurrentUser = () => {
        return getToken()
            .then(token => {
                fetch(`/api/collections`, {
                    method: "GET",
                    headers: {
                        Authorization: `Bearer ${token}`,
                    },
                })
                    .then(response => response.json())
                // .then(res => {
                //     console.log(res)
                //     return res
                // })
            })
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

    const removeStarFromTune = (tuneId) => {
        return getToken().then((token) => {
            fetch(`api/unstar/${tuneId}`, {
                method: 'PATCH',
                headers: {
                    "Content-Type": "application/json"
                }
            })
        })
    }


    //need to replace or remove all functions below here


    // removes Tune from database
    const deleteTune = tuneId => {
        return fetch(`http://localhost:8088/tunes/${tuneId}`, {
            method: 'DELETE'
        })
        // .then(deleteUnusedCollections)
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

    const getTuneById = id => {
        return fetch(`http://localhost:8088/tunes/${id}`)
            .then(res => res.json())
    }

    const getStarredTunesByUserId = (userId) => {
        return fetch(`http://localhost:8088/tunes/?userId=${userId}&starred=1`)
            .then(res => res.json())
        // .then(setTunes)
    }



    return (
        <TuneContext.Provider value={{
            tune, tunes, getTunesInCollectionForCurrentUser, addTune, editTune, deleteTune, getTuneById, getStarredTunesByUserId, addStarToTune, removeStarFromTune, addAudioToTune,
        }}>
            {props.children}
        </TuneContext.Provider>
    )
}
