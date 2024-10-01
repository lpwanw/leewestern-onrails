import React from "react"
import { cn } from "@utils"

export default function ({ className }) {
  return (
    <div
      className={cn("animate-pulse bg-gray-200 dark:bg-gray-700", className)}
    ></div>
  )
}
