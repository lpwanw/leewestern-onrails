import React, {startTransition, useState} from "react"
import {cn} from "@utils"
import {motion, useMotionValue} from "framer-motion"
import GrayCard from "@ui/GrayCard"
import LoopVideo from "@ui/LoopVideo"
import { IconSquareLetterT, IconSquareLetterA, IconSquareLetterY, IconSquareLetterN, IconSquareLetterE } from "@tabler/icons-react"
import Boxes from "@ui/background-boxes"

export default function() {
  const xPin = useMotionValue(0)
  const yPin = useMotionValue(0)
  const showPin = useMotionValue(0)
  const [pinTitle, setPinTitle] = useState("")

  const handleMouseMove = (e) => {
    startTransition(() => {
      xPin.set(e.clientX)
      yPin.set(e.clientY)
    })
  }

  return (
    <div
      onMouseMove={handleMouseMove}
      className="h-full relative w-full overflow-hidden bg-gray-50 dark:bg-neutral-900 flex flex-col items-center justify-center">
      <div
        className="absolute inset-0 w-full h-full z-20 bg-inherit [mask-image:radial-gradient(transparent,white)] pointer-events-none"/>

      <Boxes>
        <GrayCard onMouseEnter={() => {
          startTransition(() => {
            showPin.set(1)
            setPinTitle("/craft")
          })
        }}
        onMouseLeave={() => {
          startTransition(() => {
            showPin.set(0)
          })
        }}
        href={"/craft"}
        className={"absolute z-30 col-start-[18] col-span-2 row-start-[20]"}>
          <LoopVideo className={"h-full"} url={"https://cdn.rauno.me/flume-s2.mp4#t=0.01"}/>
        </GrayCard>
        <GrayCard onMouseEnter={() => {
          startTransition(() => {
            showPin.set(1)
            setPinTitle("/craft")
          })
        }}
        onMouseLeave={() => {
          startTransition(() => {
            showPin.set(0)
          })
        }}
        href={"/craft"}
        className={"absolute z-30 col-start-[27] col-span-2 row-start-[21]"}>
          <LoopVideo url={"https://cdn.rauno.me/gooey-s.mp4#t=0.01"}/>
        </GrayCard>

        <IconSquareLetterT className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[20] row-start-[24] col-span-2 row-span-2 pointer-events-none" />
        <IconSquareLetterA className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[22] row-start-[26] col-span-2 row-span-2 pointer-events-none" />
        <IconSquareLetterY className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[24] row-start-[24] col-span-2 row-span-2 pointer-events-none" />
        <IconSquareLetterN className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[26] row-start-[26] col-span-2 row-span-2 pointer-events-none" />
        <IconSquareLetterE className="dark:text-gray-200 h-full w-full absolute z-30 col-start-[28] row-start-[24] col-span-2 row-span-2 pointer-events-none" />
      </Boxes>

      <motion.div style={{y: yPin, x: xPin, opacity: showPin, translateY: "-100%"}}
        className={cn(
          "pointer-events-none absolute top-0 left-0",
        )}>
        <span className={"text-sm italic dark:text-gray-300"}>{pinTitle}</span>
        <div className="h-32 w-[1px] bg-black dark:bg-white">

        </div>
      </motion.div>
    </div>
  )
}
