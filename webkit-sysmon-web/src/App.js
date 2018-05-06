import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

class App extends Component {
  state = {
    value: 0
  };

  constructor(props) {
    super(props);
    window.pushData = this.dataHandler;
  }

  // this will get called from native code:
  dataHandler = data => {
    this.setState({
      value: data.model
    });
  };

  handleClick = e => {
    e.preventDefault();
    window.webkit.messageHandlers.refresh.postMessage({});
  };

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Value: {this.state.value}</h1>
        </header>
        <p className="App-intro">
          <a href="" onClick={this.handleClick}>
            Refresh
          </a>
        </p>
      </div>
    );
  }
}

export default App;
