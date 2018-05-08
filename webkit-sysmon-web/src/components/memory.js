import Col from "muicss/lib/react/col";
import Row from "muicss/lib/react/row";
import React from "react";

const headerStyle = "mui--text-subhead mui--text-dark-secondary";
const valueStyle = "mui--text-body1";

const Memory = ({ memory }) => {
  return (
    <Row className="tab">
      <Col xs="2">
        <div className={headerStyle}>Free</div>
        <div className={valueStyle}>{memory.free}</div>
      </Col>
      <Col xs="2">
        <div className={headerStyle}>Wired</div>
        <div className={valueStyle}>{memory.wired}</div>
      </Col>
      <Col xs="2">
        <div className={headerStyle}>Active</div>
        <div className={valueStyle}>{memory.active}</div>
      </Col>
      <Col xs="2">
        <div className={headerStyle}>Inactive</div>
        <div className={valueStyle}>{memory.inactive}</div>
      </Col>
      <Col xs="2">
        <div className={headerStyle}>Compressed</div>
        <div className={valueStyle}>{memory.compressed}</div>
      </Col>
    </Row>
  );
};

export default Memory;
