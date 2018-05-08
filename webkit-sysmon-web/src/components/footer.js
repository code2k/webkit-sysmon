import React from "react";

const Footer = props => {
  const { lastUpdated, onRefresh } = props;
  return (
    <footer>
      <div className="mui--text-dark-secondary">
        Last updated: {lastUpdated && lastUpdated.toLocaleString()} -{" "}
        <a href="" onClick={onRefresh}>
          Refresh
        </a>
      </div>
    </footer>
  );
};

export default Footer;
