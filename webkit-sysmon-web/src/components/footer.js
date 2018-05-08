/**
 * Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
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
