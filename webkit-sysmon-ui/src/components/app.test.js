import React from "react";
import ReactDOM from "react-dom";
import App from "./app";

beforeEach(() => {
  window.webkit = {
    messageHandlers: {
      refresh: {
        postMessage: jest.fn()
      }
    }
  };
});

it("renders without crashing", () => {
  const div = document.createElement("div");
  ReactDOM.render(<App />, div);
  ReactDOM.unmountComponentAtNode(div);
});

it("is doing the initial refresh call", () => {
  const div = document.createElement("div");
  ReactDOM.render(<App />, div);
  expect(
    window.webkit.messageHandlers.refresh.postMessage.mock.calls.length
  ).toBe(1);
  ReactDOM.unmountComponentAtNode(div);
});
