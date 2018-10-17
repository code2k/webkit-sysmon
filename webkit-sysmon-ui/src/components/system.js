/**
 * Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from "react";
import Divider from "muicss/lib/react/divider";
import { TitleValue } from "./common";

const formatUptime = uptime => {
  const { days, hours, minutes } = uptime;
  const upDays = days > 0 ? `${days} day${days > 1 ? "s" : ""}, ` : "";
  return `${upDays}${hours}h ${minutes}m`;
};

const System = ({ data }) => {
  return (
    <div className="tab">
      <TitleValue title="Model" value={data.model} />
      <TitleValue title="Physical Cores" value={data.physicalCores} />
      <TitleValue title="Logical Cores" value={data.logicalCores} />
      <Divider className="spacer" />
      <TitleValue title="Threads" value={data.threadCount} />
      <TitleValue title="Processes" value={data.processCount} />
      <Divider className="spacer" />
      <TitleValue title="Uptime" value={formatUptime(data.uptime)} />
    </div>
  );
};

export default System;
