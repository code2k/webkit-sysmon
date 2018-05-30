/**
 * Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from "react";
import Divider from "muicss/lib/react/divider";
import { TitleValue } from "./common";

const Cpu = ({ loadAverage, usage }) => {
  const load = loadAverage.join(" / ");
  return (
    <div class="tab">
      <TitleValue title="System" value={usage.system + "%"} />
      <TitleValue title="User" value={usage.user + "%"} />
      <TitleValue title="Idle" value={usage.idle + "%"} />
      <TitleValue title="Nice" value={usage.nice + "%"} />
      <Divider className="spacer" />
      <TitleValue title="Load Average" value={load} />
    </div>
  );
};

export default Cpu;
