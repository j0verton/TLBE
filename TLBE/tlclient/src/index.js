import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router } from "react-router-dom";
import './index.css';
import store from './app/store';
import { Provider } from 'react-redux';
import 'semantic-ui-css/semantic.min.css'
import { TuneList } from './TuneList';

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <Router>
        <TuneList />
      </Router>
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);