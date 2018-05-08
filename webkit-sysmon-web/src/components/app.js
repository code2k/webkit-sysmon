import Container from "muicss/lib/react/container";
import Tabs from "muicss/lib/react/tabs";
import Tab from "muicss/lib/react/tab";
import React, { Component } from "react";
import Footer from "./footer";
import Memory from "./memory";
import Battery from "./battery";
import Cpu from "./cpu";
import System from "./system";

export default class App extends Component {
  state = {
    data: null,
    lastUpdated: null
  };

  constructor(props) {
    super(props);
    // register native callback
    window.pushData = this.dataHandler;
    // get initial data
    this.refresh();
  }

  // this will get called from native code:
  dataHandler = data => {
    this.setState({
      data: data,
      lastUpdated: new Date()
    });
    // refresh again in 10sec
    this.timer = setTimeout(this.refresh, 1000 * 10);
  };

  handleClick = e => {
    e.preventDefault();
    if (this.timer) {
      clearTimeout(this.timer);
    }
    this.refresh();
  };

  refresh() {
    window.webkit.messageHandlers.refresh.postMessage({});
  }

  render() {
    const { lastUpdated, data } = this.state;
    return (
      <div className="app">
        <div className="content-wrapper">
          <Container fluid={true}>
            <Tabs defaultSelectedIndex={0}>
              <Tab value="system" label="System">
                {data && (
                  <System data={data} />
                )}
              </Tab>
              <Tab value="cpu" label="CPU">
                {data && (
                  <Cpu loadAverage={data.loadAverage} usage={data.usage} />
                )}
              </Tab>
              <Tab value="memory" label="Memory">
                {data && <Memory memory={data.memory} />}
              </Tab>
              <Tab value="battery" label="Battery">
                {data && <Battery battery={data.battery} />}
              </Tab>
            </Tabs>
          </Container>
        </div>
        <Footer lastUpdated={lastUpdated} onRefresh={this.handleClick} />
      </div>
    );
  }
}
