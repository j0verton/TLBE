import React, { useState, useEffect } from "react"
// import "./Tune.css"
import { Icon } from 'semantic-ui-react'

export const AudioPlayer = ({ url }) => {
    const [playing, setPlaying] = useState(false);
    const [audio, setAudio] = useState({});

    const toggleAudio = () => {
        playing ? audio.pause() : audio.play()
        setPlaying(!playing)
    }

    useEffect(() => {
        setAudio(new Audio(url))
    }, [])

    return (
        <div>
            {<Icon name={playing ? "pause" : "play"} onClick={toggleAudio} />}
        </div>
    )
}
