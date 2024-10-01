import React, { Suspense, useEffect, useState } from "react"
import CraftCard from "@ui/CraftCard"
import { CardSkeleton } from "@skeletons/CardPageSkeleton"

const crafts = [
  {
    name: "First Card",
    date: "September 2024",
    videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01",
  },
  {
    name: "Second Card",
    date: "September 2024",
    url: "/",
    videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01",
  },
  {
    name: "Third Card",
    date: "September 2024",
    url: "/",
    videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01",
  },
  {
    name: "Fourth Card",
    date: "September 2024",
    url: "/",
    videoUrl: "https://cdn.rauno.me/gooey-tooltip.mp4#t=0.01",
  },
]

export default function () {
  const [itemsCols, setItemsCols] = useState([crafts])

  const updateColumns = () => {
    const width = window.innerWidth
    if (width < 768) {
      setItemsCols(splitArrayIntoColumns(crafts, 1))
    } else if (width < 1024) {
      setItemsCols(splitArrayIntoColumns(crafts, 2))
    } else {
      setItemsCols(splitArrayIntoColumns(crafts, 3))
    }
  }

  useEffect(() => {
    updateColumns() // Set initial columns
    window.addEventListener("resize", updateColumns) // Update on resize

    return () => {
      window.removeEventListener("resize", updateColumns) // Cleanup
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  const splitArrayIntoColumns = (array, numColumns) => {
    const result = Array.from({ length: numColumns }, () => [])
    array.forEach((item, index) => {
      result[index % numColumns].push(item)
    })
    return result
  }

  return (
    <div className="w-full gap-2 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 p-1 md:p-2">
      {itemsCols.map((items, index) => (
        <div key={"col+" + index} className={"flex h-fit flex-col gap-2"}>
          {items.map(({ name, date, url, videoUrl }) => (
            <Suspense key={name + "_" + date} fallback={<CardSkeleton />}>
              <CraftCard
                name={name}
                date={date}
                url={url}
                videoUrl={videoUrl}
                key={name + "_" + date}
              />
            </Suspense>
          ))}
        </div>
      ))}
    </div>
  )
}
