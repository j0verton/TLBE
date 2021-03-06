import React, { useState, useRef, useContext, useEffect } from "react"
import "./Tune.css"
import { Button, Container, Divider, Header, Rating } from 'semantic-ui-react'
import { TuneCard } from "./TuneCard"
import { TuneContext } from "../../providers/TuneProvider"
// import { CollectionContext } from "../collections/CollectionsProvider"
import { AudioPlayer } from "../AudioPlayer"

export const ListCard = ({ collectionId, parentCallback, tunesArr }) => {
    const [modal, showModal] = useState(false)
    const [tuneObj, setTuneObj] = useState({})
    const { addStarToTune, removeStarFromTune } = useContext(TuneContext)
    // const { tuneCollections, getTuneCollectionsByCollectionIdWithTunes } = useContext(CollectionContext)
    // const [tunesArr, setTunesArr] = useState([])
    const tuneRef = useRef(null)

    const handleOpen = () => {
        showModal(true)
    }

    const handleClose = () => {
        showModal(false)
    }

    const handleStar = (event, data) => {
        const [prefix, tuneId] = data.id.split("__")
        data.rating === 0 ? removeStarFromTune(tuneId) : addStarToTune(tuneId)
    }

    // useEffect(() => {
    //     getTuneCollectionsByCollectionIdWithTunes(collectionId)
    // }, [])

    // useEffect(() => {
    //     setTunesArr(tuneCollections.map(entry => entry.tune))
    // }, [tuneCollections])

    return tunesArr[0] ? (
        <><Container
            style={{
                display: "flex",
                flexDirection: "column",
                textAlign: "left"
            }}
        >
            {tunesArr.filter(tune => !tune.learning).sort((a, b) => a.name.localeCompare(b.name)).map(tune => {
                return <><Button as='h3'
                    ref={tuneRef}
                    key={tune.id}
                    style={{
                        textAlign: "left",
                        marginBottom: "2%"
                    }}
                    id={tune.id}
                    className="tuneEntry">
                    <p
                        className="tuneP"
                        onClick={e => {
                            handleOpen()
                            setTuneObj(tune)
                        }} >
                        {tune.name}
                    </p>
                    <div className="buttonContainer">
                        {tune.audioUpload ?
                            <AudioPlayer className="playButton" url={tune.audioUpload} />
                            : null
                        }

                        <Rating
                            name="starred"
                            icon='star'
                            className="rating"
                            id={`tune__${tune.id}`}
                            onRate={handleStar}
                            Rating={tune?.starred}
                        />
                    </div>
                </Button>
                </>
            })
            }
        </Container>
            {tunesArr.filter(tune => tune.learning).length ?
                <>
                    <Divider horizontal>
                        <Header style={{ color: "#FFF1D6" }} as='h4'>
                            still learning
            </Header>
                    </Divider>
                    <Container
                        style={{
                            display: "flex",
                            flexDirection: "column",
                            textAlign: "left"
                        }}
                    >
                        {tunesArr.filter(tune => tune.learning).sort((a, b) => a.name.localeCompare(b.name)).map(tune => {
                            return <><Button as='h3'
                                ref={tuneRef}
                                key={tune.id}
                                id={tune.id}
                                className="tuneEntry">
                                <p
                                    onClick={e => {
                                        handleOpen()
                                        setTuneObj(tune)
                                    }} >
                                    {tune.name}
                                </p>
                                <div className="buttonContainer">
                                    {tune.audioUpload ? <AudioPlayer className="playButton" url={tune.audioUpload} /> : null}
                                    <Rating
                                        name="starred"
                                        icon='star'
                                        id={`tune__${tune.id}`}
                                        onRate={handleStar}
                                        defaultRating={tune?.starred}
                                    />
                                </div>
                            </Button>
                            </>
                        })
                        }
                    </Container>
                </>
                : null
            }

            {modal ? <><TuneCard id={tuneObj.id} tuneObj={tuneObj} handleOpen={handleOpen} handleClose={handleClose} /></> : null}
        </>
    ) : null
}