import React from "react";
import { Outlet } from "react-router-dom";

export default function() {
  return (
    <div className="flex h-screen flex-col bg-white dark:bg-gray-900">
      <Outlet />
    </div>
  )
}
