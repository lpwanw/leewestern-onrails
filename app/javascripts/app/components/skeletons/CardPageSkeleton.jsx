import React from "react"
import Skeleton from "@ui/Skeleton"

export const CardSkeleton = () => {
  return (
    <div className={"flex flex-col space-y-3 p-2"}>
      <Skeleton className="rounded-xl w-full grow" />
      <div className="space-y-2">
        <Skeleton className="h-4 w-full" />
      </div>
    </div>
  )
}

export default function () {
  const items = new Array(12).fill(1)
  return (
    <div
      className={
        "h-screen w-full grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-2 p-4"
      }
    >
      {items.map((_, i) => (
        <CardSkeleton key={"skeleton_card" + i} />
      ))}
    </div>
  )
}
