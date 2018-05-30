/**
 * Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import Col from "muicss/lib/react/col";
import Row from "muicss/lib/react/row";
import React from "react";

const headerStyle = "mui--text-body1 mui--text-dark-secondary";
const valueStyle = "mui--text-body1";

const TitleValue = ({ title, value }) => (
  <Row>
    <Col xs="3" className={headerStyle}>{title}</Col>
    <Col xs="9" className={valueStyle}>{value}</Col>
  </Row>
);

export { TitleValue, headerStyle, valueStyle };
