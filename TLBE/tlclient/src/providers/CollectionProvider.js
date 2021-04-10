import React, { useState, createContext } from "react"

export const CollectionContext = createContext()

export const CollectionProvider = props => {

    const addCustomCollection = (collectionName) => {
        return fetch('http://localhost:8088/collections', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                userId: parseInt(localStorage.getItem("userProfile")),
                name: collectionName,
                custom: true
            })
        })
    }

    const getCustomCollectionsByUserId = (userId) => {
        return fetch(`http://localhost:8088/collections/?userId=${userId}&custom=true&_embed=tuneCollections`)
            .then(response => response.json())
    }

    const deleteCollection = collectionId => {
        return fetch(`http://localhost:8088/collections/${collectionId}`, {
            method: 'DELETE'
        })
        // .then(getCollections)
    }

    //delete unused Collections - need this somewhere, maybe server side


    return (
        <CollectionContext.Provider value={{
            deleteCollection, addCustomCollection, getCustomCollectionsByUserId
        }}>
            {props.children}
        </CollectionContext.Provider>
    )
}
