import React, { useContext, useState } from "react";
import { toast } from "react-toastify";
import { useHistory } from "react-router-dom"
import { Button } from "semantic-ui-react"
import { UserProfileContext } from "../../providers/UserProfileProvider";

// import video from "../../video/ibs-video.mp4"
import "./Login.css"

export const Register = (props) => {
    const { register } = useContext(UserProfileContext);
    const [loading, setLoading] = useState(false);
    const firstName = useRef()
    const lastName = useRef()
    const username = useRef()
    const email = useRef()
    const [password, setPassword] = useState("");
    const [confirm, setConfirm] = useState("");
    const history = useHistory();

    const handleSubmit = (e) => {
        e.preventDefault();

        if (password !== confirm) {
            toast.error("Passwords do not match");
            return;
        }

        setLoading(true);
        const profile = {
            firstName,
            lastName,
            username,
            email,
        };
        register(profile, password)
            .then((user) => {
                setLoading(false);
                toast.info(`Welcome ${user.username}`);
                history.push("/");
            })
            .catch((err) => {
                setLoading(false);
                toast.error("Invalid email");
            });
    };


    return (
        <>
            <div className="mainContainer">
                <main className="container--login" style={{ textAlign: "center" }}>

                    <form className="form--login" onSubmit={handleSubmit}>
                        <h1 className="h3 mb-3 font-weight-normal">Please Register for TuneList</h1>
                        <fieldset>
                            <label htmlFor="firstName"> First Name </label>
                            <input ref={firstName} type="text" name="firstName" className="form-control" placeholder="First name" required autoFocus />
                        </fieldset>

                        <fieldset>
                            <label htmlFor="lastName"> Last Name </label>
                            <input ref={lastName} type="text" name="lastName" className="form-control" placeholder="Last name" required />
                        </fieldset>

                        <fieldset>
                            <label htmlFor="username"> Username </label>
                            <input ref={username} type="text" name="username" className="form-control" placeholder="Username" required />
                        </fieldset>

                        <fieldset>
                            <label htmlFor="inputEmail"> Email address </label>
                            <input ref={email} type="email" name="email" className="form-control" placeholder="Email address" required />
                        </fieldset>

                        <div className="registerBtns">
                            <fieldset>
                                <Button primary type="submit"> Sign in </Button>
                            </fieldset>

                            <fieldset>
                                <Button type="button" onClick={() => {
                                    history.push("/login")
                                }}> Cancel </Button>
                            </fieldset>
                        </div>
                    </form>
                </main>
                {/* 
                <video className="videoTag" autoPlay loop muted>
                    <source src={video} type="video/mp4" />
                </video> */}
            </div>
        </>
    )
}