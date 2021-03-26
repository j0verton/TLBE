import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router } from "react-router-dom";
import './index.css';
import store from './app/store';
import { Provider } from 'react-redux';

import 'semantic-ui-css/semantic.min.css'
import firebase from "firebase/app";
import App from './App';


const firebaseConfig = {
  apiKey: process.env.REACT_APP_FIREBASE_API_KEY,
};
firebase.initializeApp(firebaseConfig);

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>

      <Router>
        <App />
      </Router>

    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);