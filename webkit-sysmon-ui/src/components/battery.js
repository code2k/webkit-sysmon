/**
 * Copyright (c) 2018, CODE2K:LABS <https://code2k.net>
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
import React from "react";
import { TitleValue } from "./common";

const Battery = ({ battery }) => {
  return battery ? (
    <div className="tab">
      <TitleValue
        title="AC Powered"
        value={battery.isACPowered ? "YES" : "NO"}
      />
      <TitleValue title="Charged" value={battery.isCharged ? "YES" : "NO"} />
      <TitleValue title="Charging" value={battery.isCharging ? "YES" : "NO"} />
      <TitleValue title="Charge" value={battery.charge + "%"} />
      {!battery.isACPowered && (
        <TitleValue
          title="Time Remaining"
          value={battery.timeRemainingFormatted}
        />
      )}
      <TitleValue
        title="Current Capacity"
        value={battery.currentCapacity + " mAh"}
      />
      <TitleValue title="Max Capacity" value={battery.maxCapactiy + " mAh"} />
      <TitleValue
        title="Design Capacity"
        value={battery.designCapacity + " mAh"}
      />
      <TitleValue title="Cycle Count" value={battery.cycleCount} />
      <TitleValue title="Design Cycle Count" value={battery.designCycleCount} />
      <TitleValue title="Temperature" value={battery.temperature + "°C"} />
    </div>
  ) : (
    <div className="tab">
      <span className="mui--text-dark-hint">Battery not available.</span>
    </div>
  );
};

export default Battery;
